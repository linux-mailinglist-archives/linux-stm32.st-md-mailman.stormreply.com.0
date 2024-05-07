Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA148BE6C6
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 17:00:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4ED0C5E2D2;
	Tue,  7 May 2024 15:00:10 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90940CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 15:00:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F0EA0CE1394;
 Tue,  7 May 2024 14:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C703C2BBFC;
 Tue,  7 May 2024 14:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715093997;
 bh=m1MQLaFDGrfN6P6zi84CA547mIdGW4QH5fBBCzDskGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bET6S8Sp6njAjTyzEh5PxJ/obAZrJkfB+xs0RRD04XD+2DffyIaw71eDNvfBUyNNk
 U7PG9Jtc9nRYPuedBSlCvtzJ9H20k8j0sLzQvSK1icS521V/DaGRcmIJGWUe26E7rS
 SEyeKRkqunXq/PsvI4peOSv+z2IG8EGRecMC0UQTSF5GuDhluuCC8kRs51NzQ8quKq
 LQulxLIV7twktBPiL0Egc0z9hn602kOtx3LlA2k6h9B63Rydk+9VEPX42xpXnpLGmI
 vyGaaEQpZfB9tM3hLsXtL8Yy4AXg54TnAtFNh9UeIwIhB4hA9NuwCDdnlKm3sF4yT3
 TNDmUpynzoe8w==
Date: Tue, 7 May 2024 11:59:55 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@arm.com>
Message-ID: <ZjpB65YJcMGIJFoH@x1>
References: <20240429152207.479221-1-james.clark@arm.com> <ZjVH118DtAdZKo2v@x1>
 <4ab27bea-ac94-48c3-827c-9f2eddcdd50a@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ab27bea-ac94-48c3-827c-9f2eddcdd50a@arm.com>
Cc: scclevenger@os.amperecomputing.com, Mark Rutland <mark.rutland@arm.com>,
 Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, John Garry <john.g.garry@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 mike.leach@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 suzuki.poulose@arm.com, coresight@lists.linaro.org,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Leo Yan <leo.yan@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 gankulkarni@os.amperecomputing.com
Subject: Re: [Linux-stm32] [PATCH 00/17] coresight: Use per-sink trace ID
 maps for Perf sessions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, May 07, 2024 at 11:01:07AM +0100, James Clark wrote:
> On 03/05/2024 21:23, Arnaldo Carvalho de Melo wrote:
> > I guess I can pick the tooling part now, right? Further reviewing would
> > be nice tho.
 
> Is it ok if we wait for the driver changes to be merged first? There
> might some review comments which need a format change to the packets and
> then a re-write of the tool changes.

Ok
 
> You could take 1 and 2 though because they're unrelated.

Done.

- Arnaldo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
