package io.leres;

import org.takes.facets.fork.FkRegex;
import org.takes.facets.fork.TkFork;
import org.takes.http.Exit;
import org.takes.http.FtBasic;

public class HttpServer {

    public static void main(final String... args) throws Exception {
        new FtBasic(
                new TkFork(new FkRegex("/", "Hello, World!")), 8080
        ).start(Exit.NEVER);
    }
}
