Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3A2679DE5
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 16:47:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00F2CC6A5E1;
	Tue, 24 Jan 2023 15:47:25 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 651F4C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Jan 2023 20:54:07 +0000 (UTC)
Received: (Authenticated sender: didi.debian@cknow.org)
 by mail.gandi.net (Postfix) with ESMTPSA id A1261240002;
 Sat, 21 Jan 2023 20:54:00 +0000 (UTC)
From: Diederik de Haas <didi.debian@cknow.org>
To: Edward <edward.baker@intel.com>, Ian Rogers <irogers@google.com>
Date: Sat, 21 Jan 2023 21:53:51 +0100
Message-ID: <3632669.kckeHSHuci@prancing-pony>
Organization: Connecting Knowledge
In-Reply-To: <CAP-5=fX1-3ZnXk8G2fB0q9F3MjjA+zWWm1LbuYGc5nL5v3bXYg@mail.gmail.com>
References: <20230121184648.38487-1-didi.debian@cknow.org>
 <CAP-5=fX1-3ZnXk8G2fB0q9F3MjjA+zWWm1LbuYGc5nL5v3bXYg@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Jan 2023 15:47:20 +0000
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Sandipan Das <sandipan.das@amd.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-kernel@vger.kernel.org>,
 "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Zhengjun Xing <zhengjun.xing@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Kan Liang <kan.liang@linux.intel.com>
Subject: Re: [Linux-stm32] [PATCH] tools/perf: Various spelling fixes
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
Content-Type: multipart/mixed; boundary="===============6811919991471566461=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============6811919991471566461==
Content-Type: multipart/signed; boundary="nextPart3011192.r6BZ94o73H";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3011192.r6BZ94o73H
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
To: Edward <edward.baker@intel.com>, Ian Rogers <irogers@google.com>
Subject: Re: [PATCH] tools/perf: Various spelling fixes
Date: Sat, 21 Jan 2023 21:53:51 +0100
Message-ID: <3632669.kckeHSHuci@prancing-pony>
Organization: Connecting Knowledge
MIME-Version: 1.0

On Saturday, 21 January 2023 20:25:46 CET Ian Rogers wrote:
> The JSON files are generated from Intel information here:
> https://github.com/intel/perfmon/
> Fixing the spelling in the tree means that when we update the
> incorrect spelling will be generated again. Intel are looking at the
> matter, I've added Edward Baker to the e-mail. To make it clearer,
> could you separate the JSON fixes from the tool fixes?

Yes, I'll send a v2 patch with the JSON files excluded.
And I'll send a PR to the GH repo.

> Could you also add the mistakes found by this list to:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scri
> pts/spelling.txt which will mean the checkpatch.pl tool will flag the
> mistakes should regressions happen.

Ha! That's based on Debian's lintian tool (too) :-D
I'll make/send a separate patch to include the ones lintian found.
Lintian found several more, but I filtered the list I send to belong to `tools/
perf` hoping/assuming the To list wouldn't be so long (which didn't work out 
as well as I hoped ;-)).

> Beside those 2 suggestions, the corrections look great and thank you
> for taking the time to do this.

Cool :-)

Cheers,
  Diederik
--nextPart3011192.r6BZ94o73H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCY8xQ3wAKCRDXblvOeH7b
btaFAP0aytxwzb1318rBtyA4fWX3O+MuUiW9DjObjWT1iTj5QgD+ItsnE9DSLTBH
TVIP87d6fJOpqWWuOnip2nxC2ZOOdQM=
=IdbN
-----END PGP SIGNATURE-----

--nextPart3011192.r6BZ94o73H--




--===============6811919991471566461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6811919991471566461==--



