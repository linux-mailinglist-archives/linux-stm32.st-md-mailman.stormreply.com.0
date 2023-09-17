Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DF47A3738
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Sep 2023 21:07:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84BADC6B477;
	Sun, 17 Sep 2023 19:07:34 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01857C6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Sep 2023 19:07:32 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-414a929a6f9so22380471cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Sep 2023 12:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694977652; x=1695582452;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UMjyiKjcIjThnRSK3OwRV8eTbU+pNtmLwTMj69xBKB8=;
 b=yKaSr7jLu8j+sp1GKFg93tkf741nP0WC5yuR1onS38Ju20SX+w0qQd+DUlA4itCDli
 ptq+QpH+d12kwxY0GDu49rAbNIfTSrzziLW2ouW0YydFtyGt07PeNiHLFtutS9/YSszD
 MAtHDyPIDb8gLvbEweGc5EbHdPc4+zC50fwhG41BBVJUC9SZdqaus5D40qxmqVGzH3gT
 CDGtNQ0wrjUjuuKa0k2QBAbaAEVNA3D+ZICTajhn+gFpTUXWbGl6Tf0v9LS8SUshYBhV
 leHAhcW4Spib4qMZnSQh/hr5PvKpllOD6CpAj12nYao3scscfcIhxVvTIXGwuzTm0XhX
 R9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694977652; x=1695582452;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UMjyiKjcIjThnRSK3OwRV8eTbU+pNtmLwTMj69xBKB8=;
 b=ZgSjFCAZA286lsAyhK4MvblACBWW6LjdXTDdbr5Hzsq5KBGLHi6OKNLpgi48lBAyq3
 Y1Wy19EUmgjk3dPkUVpnKv8/mebVPbOVqwRB8Pi4lhyw3yJOz1llvLgqZmyyrf99gQcI
 sP0iAhqtpK7jn33bNMl9CfHITLHhK9B359rSjS1Y66U8GjBkYFQhvSeVbeP2VEvCpSGm
 c9n73gW9wLAVje1mz7fDiVu9iNGh9UzPKn6e9rAoYZfGljFnA6mmLxGVoMQJrKGf60ut
 0+ZklUctifOdCg0qvccd/5fZ4dh4sVw/J1yrwpu2B++0bQkEXWrHU13dMSl+BXHza/Q+
 0KVQ==
X-Gm-Message-State: AOJu0YxNKIi/LHoEW6h3rfBbUldxS5rD7roI28DtCQquyOvVanQyW82C
 JWlz+E2FdN7aw9u6vSwlaEW5rw==
X-Google-Smtp-Source: AGHT+IFDDPauVBdRUyG9d+Mqw/i8BrU/jO/81H9R3cVU0v9ic2TiG+mq78JU3yhkiaChDWMq6lHCRg==
X-Received: by 2002:a05:622a:148f:b0:412:43a5:e5a4 with SMTP id
 t15-20020a05622a148f00b0041243a5e5a4mr8270898qtx.65.1694977651635; 
 Sun, 17 Sep 2023 12:07:31 -0700 (PDT)
Received: from fedora ([12.184.218.19]) by smtp.gmail.com with ESMTPSA id
 c11-20020ac84e0b000000b00405d7c1a4b0sm2502069qtw.15.2023.09.17.12.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Sep 2023 12:07:30 -0700 (PDT)
Date: Sun, 17 Sep 2023 15:07:28 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZQdOcDQR6qONmmnR@fedora>
References: <20230829134029.2402868-1-fabrice.gasnier@foss.st.com>
 <20230829134029.2402868-4-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230829134029.2402868-4-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/8] tools/counter: add a flexible watch
	events tool
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4146584023429568033=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4146584023429568033==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0CjZ0cR1b7rLobuC"
Content-Disposition: inline


--0CjZ0cR1b7rLobuC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 03:40:24PM +0200, Fabrice Gasnier wrote:
> This adds a new counter tool to be able to test various watch events.
> A flexible watch array can be populated from command line, each field
> may be tuned with a dedicated command line argument.
> Each argument can be repeated several times: each time it gets repeated,
> a corresponding new watch element is allocated.
>=20
> It also comes with a simple default watch (to monitor overflows), used
> when no watch parameters are provided.
>=20
> The print_usage() routine proposes another example, from the command line,
> which generates a 2 elements watch array, to monitor:
> - overflow events
> - capture events, on channel 3, that reads read captured data by
>   specifying the component id (capture3_component_id being 7 here).
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Hi Fabrice,

This is great idea, it'll make it so much easier to test out drivers
so I'm excited! :-)

This is a new tool, so would you add a MAINTAINERS entry for the
counter_watch_events.c file?

More comments inline below.

> ---
>  tools/counter/Build                  |   1 +
>  tools/counter/Makefile               |   8 +-
>  tools/counter/counter_watch_events.c | 348 +++++++++++++++++++++++++++
>  3 files changed, 356 insertions(+), 1 deletion(-)
>  create mode 100644 tools/counter/counter_watch_events.c
>=20
> diff --git a/tools/counter/Build b/tools/counter/Build
> index 33f4a51d715e..4bbadb7ec93a 100644
> --- a/tools/counter/Build
> +++ b/tools/counter/Build
> @@ -1 +1,2 @@
>  counter_example-y +=3D counter_example.o
> +counter_watch_events-y +=3D counter_watch_events.o
> diff --git a/tools/counter/Makefile b/tools/counter/Makefile
> index b2c2946f44c9..00e211edd768 100644
> --- a/tools/counter/Makefile
> +++ b/tools/counter/Makefile
> @@ -14,7 +14,7 @@ MAKEFLAGS +=3D -r
> =20
>  override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
> =20
> -ALL_TARGETS :=3D counter_example
> +ALL_TARGETS :=3D counter_example counter_watch_events
>  ALL_PROGRAMS :=3D $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
> =20
>  all: $(ALL_PROGRAMS)
> @@ -31,6 +31,12 @@ $(OUTPUT)include/linux/counter.h: ../../include/uapi/l=
inux/counter.h
> =20
>  prepare: $(OUTPUT)include/linux/counter.h
> =20
> +COUNTER_WATCH_EVENTS :=3D $(OUTPUT)counter_watch_events.o
> +$(COUNTER_WATCH_EVENTS): prepare FORCE
> +	$(Q)$(MAKE) $(build)=3Dcounter_watch_events
> +$(OUTPUT)counter_watch_events: $(COUNTER_WATCH_EVENTS)
> +	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> +

Move this below the COUNTER_EXAMPLE block just so we can keep the
recipes in alphabetical order.

>  COUNTER_EXAMPLE :=3D $(OUTPUT)counter_example.o
>  $(COUNTER_EXAMPLE): prepare FORCE
>  	$(Q)$(MAKE) $(build)=3Dcounter_example
> diff --git a/tools/counter/counter_watch_events.c b/tools/counter/counter=
_watch_events.c
> new file mode 100644
> index 000000000000..7f73a1519d8e
> --- /dev/null
> +++ b/tools/counter/counter_watch_events.c
> @@ -0,0 +1,348 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Counter - Test various watch events in a userspace application

"Counter" should be "Counter Watch Events" (or "counter_watch_events").

> + * inspired by counter_example.c

No need to mention counter_example.c, this utility does far more than
and bares little resemblance at this point to counter_example.c which is
really just a bare minimal example of watching Counter events.

> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <getopt.h>
> +#include <linux/counter.h>
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <unistd.h>
> +
> +#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))

My initial reaction was that this macro is already exposed in some
header for us, but my local /usr/include/linux/kernel.h file doesn't
appear to bare it so I guess not. Perhaps it'll be fine for our needs --
I think the only difference between this ARRAY_SIZE and the Linux kernel
one is the addition of __must_be_array(x).

> +
> +static struct counter_watch simple_watch[] =3D {
> +	{
> +		/* Component data: Count 0 count */
> +		.component.type =3D COUNTER_COMPONENT_COUNT,
> +		.component.scope =3D COUNTER_SCOPE_COUNT,
> +		.component.parent =3D 0,
> +		/* Event type: Index */
> +		.event =3D COUNTER_EVENT_OVERFLOW_UNDERFLOW,

There's a bit of confusion here. The comment says the event type is
INDEX, but the structure event type is set for OVERFLOW_UNDERFLOW; also,
the commit description states that we're monitoring "overflows" which
implies to me the OVERFLOW event type. So which of the three is it?

> +		/* Device event channel 0 */
> +		.channel =3D 0,
> +	},
> +};
> +
> +static int find_match_or_number_from_array(char *arg, const char * const=
 str[], int sz, __u8 *val)
> +{
> +	unsigned int i;
> +	char *dummy;
> +	unsigned long idx;
> +	int ret;
> +
> +	for (i =3D 0; i < sz; i++) {
> +		ret =3D strncmp(arg, str[i], strlen(str[i]));
> +		if (!ret && strlen(str[i]) =3D=3D strlen(arg)) {
> +			*val =3D i;
> +			return 0;
> +		}

This has several strlen calls so I wonder if it's more wasteful than it
needs to me. I suppose the compiler would optimize this away, but I
think there is an alternative solution.

We're checking for an exact match, so you don't need the string length.
Instead, you can compare each character, break when characters differ,
or return 0 when you reached the null byte for both. So something like
this:

    for (j =3D 0; arg[j] =3D=3D str[i][j]; j++) {
            /* If we reached the end of the strings */
            if (arg[j] =3D=3D '\0') {
                    *val =3D i;
                    return 0;
            }
    }
    /* Strings do not match; continue to the next string */

We end up with the same number of lines, so I'll leave it up to you
whether you want to use this solution, or if you consider the existing
code clearer read.

> +	}
> +
> +	/* fallback to number */

I'm not sure it makes sense to support numbers. Although it's true that
the component type, component scope, and event type are passed as __u8
values, users are expected to treat those values are opaque and pass
them via the respective enum constants. Since we don't guarantee that
the specific enum constant values will remain consistent between kernel
versions, I don't think it's a good idea to give to users that sort of
implication by allowing them to use raw numbers for configuration
selection.

> +	idx =3D strtoul(optarg, &dummy, 10);
> +	if (!errno) {
> +		if (idx >=3D sz)
> +			return -EINVAL;
> +		*val =3D idx;
> +		return 0;
> +	}
> +
> +	return -errno;
> +}
> +
> +static const char * const counter_event_type_name[] =3D {
> +	"COUNTER_EVENT_OVERFLOW",
> +	"COUNTER_EVENT_UNDERFLOW",
> +	"COUNTER_EVENT_OVERFLOW_UNDERFLOW",
> +	"COUNTER_EVENT_THRESHOLD",
> +	"COUNTER_EVENT_INDEX",
> +	"COUNTER_EVENT_CHANGE_OF_STATE",
> +	"COUNTER_EVENT_CAPTURE",
> +};
> +
> +static int counter_arg_to_event_type(char *arg, __u8 *event)
> +{
> +	return find_match_or_number_from_array(arg, counter_event_type_name,
> +					       ARRAY_SIZE(counter_event_type_name), event);
> +}
> +
> +static const char * const counter_component_type_name[] =3D {
> +	"COUNTER_COMPONENT_NONE",
> +	"COUNTER_COMPONENT_SIGNAL",
> +	"COUNTER_COMPONENT_COUNT",
> +	"COUNTER_COMPONENT_FUNCTION",
> +	"COUNTER_COMPONENT_SYNAPSE_ACTION",
> +	"COUNTER_COMPONENT_EXTENSION",
> +};
> +
> +static int counter_arg_to_component_type(char *arg, __u8 *type)
> +{
> +	return find_match_or_number_from_array(arg, counter_component_type_name,
> +					       ARRAY_SIZE(counter_component_type_name), type);
> +}
> +
> +static const char * const counter_scope_name[] =3D {
> +	"COUNTER_SCOPE_DEVICE",
> +	"COUNTER_SCOPE_SIGNAL",
> +	"COUNTER_SCOPE_COUNT",
> +};
> +
> +static int counter_arg_to_scope(char *arg, __u8 *type)
> +{
> +	return find_match_or_number_from_array(arg, counter_scope_name,
> +					       ARRAY_SIZE(counter_scope_name), type);
> +}
> +
> +static void print_usage(void)
> +{
> +	fprintf(stderr, "Usage: counter_watch_events [options]...\n"
> +		"Test various watch events for given counter device\n"
> +		"  --channel -c <n>\n"
> +		"        Set watch.channel\n"
> +		"  --debug -d\n"
> +		"        Prints debug information\n"
> +		"  --event -e <number or counter_event_type string>\n"
> +		"        Sets watch.event\n"
> +		"  --help -h\n"
> +		"        Prints usage\n"
> +		"  --device-num -n <n>\n"
> +		"        Set device number (/dev/counter<n>, default to 0)\n"
> +		"  --id -i <n>\n"
> +		"        Set watch.component.id\n"
> +		"  --loop -l <n>\n"
> +		"        Loop for a number of events (forever if n < 0)\n"
> +		"  --parent -p <n>\n"
> +		"        Set watch.component.parent number\n"
> +		"  --scope -s <number or counter_scope string>\n"
> +		"        Set watch.component.scope\n"
> +		"  --type -t <number or counter_component_type string>\n"
> +		"        Set watch.component.type\n"
> +		"\n"
> +		"Example with two watched events:\n\n"
> +		"counter_watch_events -d \\\n"
> +		"\t-t COUNTER_COMPONENT_COUNT -s COUNTER_SCOPE_COUNT"
> +		" -e COUNTER_EVENT_OVERFLOW_UNDERFLOW -i 0 -c 0 \\\n"
> +		"\t-t COUNTER_COMPONENT_EXTENSION -s COUNTER_SCOPE_COUNT"
> +		" -e COUNTER_EVENT_CAPTURE -i 7 -c 3\n"
> +		);
> +}

Are you following any particular convention for the usage description? I
wonder if there is a particular preferred standard for command-line
interface descriptions. A quick search brought up a few, such as the
POSIX Utility Conventions[^1] and docopt[^2].

One improvement I would recommend here is to put the short form of the
option before the long form and separate them with a command to make it
clearer (e.g. "-h, --help").

[^1] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap12.ht=
ml
[^2] http://docopt.org

> +
> +static void print_watch(struct counter_watch *watch, int nwatch)
> +{
> +	int i;
> +
> +	/* prints the watch array in C-like structure */
> +	printf("watch[%d] =3D {\n", nwatch);
> +	for (i =3D 0; i < nwatch; i++) {
> +		printf(" [%d] =3D\t{\n"
> +		       "\t\t.component.type =3D %s\n"
> +		       "\t\t.component.scope =3D %s\n"
> +		       "\t\t.component.parent =3D %d\n"
> +		       "\t\t.component.id =3D %d\n"
> +		       "\t\t.event =3D %s\n"
> +		       "\t\t.channel =3D %d\n"
> +		       "\t},\n",
> +		       i,
> +		       counter_component_type_name[watch[i].component.type],
> +		       counter_scope_name[watch[i].component.scope],
> +		       watch[i].component.parent,
> +		       watch[i].component.id,
> +		       counter_event_type_name[watch[i].event],
> +		       watch[i].channel);
> +	}
> +	printf("};\n");
> +}
> +
> +static const struct option longopts[] =3D {
> +	{ "channel",		required_argument, 0, 'c' },
> +	{ "debug",		no_argument,       0, 'd' },
> +	{ "event",		required_argument, 0, 'e' },
> +	{ "help",		no_argument,       0, 'h' },
> +	{ "device-num",		required_argument, 0, 'n' },
> +	{ "id",			required_argument, 0, 'i' },
> +	{ "loop",		required_argument, 0, 'l' },
> +	{ "parent",		required_argument, 0, 'p' },
> +	{ "scope",		required_argument, 0, 's' },
> +	{ "type",		required_argument, 0, 't' },
> +	{ },
> +};
> +
> +int main(int argc, char **argv)
> +{
> +	int c, fd, i, ret;
> +	struct counter_event event_data;
> +	char *device_name =3D NULL;
> +	int debug =3D 0, loop =3D -1;
> +	char *dummy;
> +	int dev_num =3D 0, nwatch =3D 0, ncfg[] =3D {0, 0, 0, 0, 0, 0};
> +	int num_chan =3D 0, num_evt =3D 0, num_id =3D 0, num_p =3D 0, num_s =3D=
 0, num_t =3D 0;
> +	struct counter_watch *watches;
> +
> +	/*
> +	 * 1st pass: count events configurations number to allocate the watch a=
rray.
> +	 * Each watch argument can be repeated several times: each time it gets=
 repeated,
> +	 * a corresponding watch is allocated (and configured) in 2nd pass.
> +	 */

It feels a somewhat prone to error (at least cumbersome) to populate
each watch via individual arguments for each field. Since a watch always
has these fields, perhaps instead we could pass some format string that
represents a watch, and deliminate watches via commas. For example, we
could have --watch=3D"cco00,ecc73" to represent the two watches in the
usage example.

Of course, we'd need to define a more robust format string convention
than in my example to ensure the correct configuration is properly
communicated. What do you think, would this approach would make things
simpler, or just more complicated in the end?

> +	while ((c =3D getopt_long(argc, argv, "c:de:hn:i:l:p:s:t:", longopts, N=
ULL)) !=3D -1) {
> +		switch (c) {
> +		case 'c':
> +			ncfg[0]++;
> +			break;
> +		case 'e':
> +			ncfg[1]++;
> +			break;
> +		case 'i':
> +			ncfg[2]++;
> +			break;
> +		case 'p':
> +			ncfg[3]++;
> +			break;
> +		case 's':
> +			ncfg[4]++;
> +			break;
> +		case 't':
> +			ncfg[5]++;
> +			break;
> +		};
> +	};
> +
> +	for (i =3D 0; i < ARRAY_SIZE(ncfg); i++)
> +		if (ncfg[i] > nwatch)
> +			nwatch =3D ncfg[i];
> +
> +	if (nwatch) {
> +		watches =3D calloc(nwatch, sizeof(*watches));

We need to check if calloc fails, right?

William Breathitt Gray=20

--0CjZ0cR1b7rLobuC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZQdOcAAKCRC1SFbKvhIj
K2wvAQD8eRqrhoq8ZWJlmfBUT9wRJNyJEmYuYjPJJN1aSKnzXgEAtZwewCO5ctue
dujKv/oQBYO+t0puah4Ik1o9tWm5bgU=
=T2EY
-----END PGP SIGNATURE-----

--0CjZ0cR1b7rLobuC--

--===============4146584023429568033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4146584023429568033==--
