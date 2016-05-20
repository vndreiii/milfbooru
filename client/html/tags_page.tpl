<div class='tag-list'>
    <% if (results.length) { %>
        <table>
            <thead>
                <th class='names'>
                    <% if (query == 'sort:name' || !query) { %>
                        <a href='/tags/text=-sort:name'>Tag name(s)</a>
                    <% } else { %>
                        <a href='/tags/text=sort:name'>Tag name(s)</a>
                    <% } %>
                </th>
                <th class='implications'>
                    <% if (query == 'sort:implication-count') { %>
                        <a href='/tags/text=-sort:implication-count'>Implications</a>
                    <% } else { %>
                        <a href='/tags/text=sort:implication-count'>Implications</a>
                    <% } %>
                </th>
                <th class='suggestions'>
                    <% if (query == 'sort:suggestion-count') { %>
                        <a href='/tags/text=-sort:suggestion-count'>Suggestions</a>
                    <% } else { %>
                        <a href='/tags/text=sort:suggestion-count'>Suggestions</a>
                    <% } %>
                </th>
                <th class='usages'>
                    <% if (query == 'sort:usages') { %>
                        <a href='/tags/text=-sort:usages'>Usages</a>
                    <% } else { %>
                        <a href='/tags/text=sort:usages'>Usages</a>
                    <% } %>
                </th>
            </thead>
            <tbody>
                <% _.each(results, tag => { %>
                    <tr>
                        <td class='names'>
                            <ul>
                                <% _.each(tag.names, name => { %>
                                    <li><%= makeTagLink(name) %></li>
                                <% }) %>
                            </ul>
                        </td>
                        <td class='implications'>
                            <% if (tag.implications.length) { %>
                                <ul>
                                    <% _.each(tag.implications, name => { %>
                                        <li><%= makeTagLink(name) %></li>
                                    <% }) %>
                                </ul>
                            <% } else { %>
                                -
                            <% } %>
                        </td>
                        <td class='suggestions'>
                            <% if (tag.suggestions.length) { %>
                                <ul>
                                    <% _.each(tag.suggestions, name => { %>
                                        <li><%= makeTagLink(name) %></li>
                                    <% }) %>
                                </ul>
                            <% } else { %>
                                -
                            <% } %>
                        </td>
                        <td class='usages'>
                            <%= tag.usages %>
                        </td>
                    </tr>
                <% }) %>
            </tbody>
        </table>
    <% } %>
</div>