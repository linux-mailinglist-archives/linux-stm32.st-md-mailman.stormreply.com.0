Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5577D25C0D7
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Sep 2020 14:21:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EADF3C3FAD8;
	Thu,  3 Sep 2020 12:21:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E915C36B21
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Sep 2020 12:21:30 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7A3620775
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Sep 2020 12:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599135689;
 bh=yWbf0IQWQYG8GUApvqXEYmzQbtffQP1dqs9sWRRBJYc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=v0u/xa9UJLUXrcWTZZoUMemPv+zBd3CSMpgN589Suv8VQ1s2XkrmOvk0DKpCHcV9h
 +dtPze1EGoTag6uBqgmM+xje7iv1HeWIjYXOV4pZBnBR+pLeQTXu8+AmpBUgAkJix7
 vqYjvd43z1HisoswK7ROdFWnV2NJDW/HlftwNars=
Received: by mail-ej1-f42.google.com with SMTP id e23so3590888eja.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Sep 2020 05:21:28 -0700 (PDT)
X-Gm-Message-State: AOAM533B9/hnD4PbAU8ygEAAT8ms+ilmFrtNRUwEiSROOjtinBOCz0aM
 22wrwBIfG//6F+Ym1rZuu6jSNez772uXHpQhwho=
X-Google-Smtp-Source: ABdhPJzJRFulG1b/WDsGvl2hfP2WPQAa7GdutvEhBtO7QHdWlTs5d/drIeB5SLH6d3FMPswoRFOciAGFyokm39RWT10=
X-Received: by 2002:a17:907:724f:: with SMTP id
 ds15mr1405794ejc.119.1599135687298; 
 Thu, 03 Sep 2020 05:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200902150530.14640-1-krzk@kernel.org>
 <a273f81f-cdf9-70ae-3691-816fa24be0a9@nxp.com>
In-Reply-To: <a273f81f-cdf9-70ae-3691-816fa24be0a9@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 3 Sep 2020 14:21:16 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfpvnMr9UnyQ3vSJOmNdNqAXdVnCDJ8W9OF=rH_amaOvQ@mail.gmail.com>
Message-ID: <CAJKOXPfpvnMr9UnyQ3vSJOmNdNqAXdVnCDJ8W9OF=rH_amaOvQ@mail.gmail.com>
To: Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>,
 Chen Zhou <chenzhou10@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe.montjoie@gmail.com>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] crypto: caam - Fix kerneldoc
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

On Thu, 3 Sep 2020 at 14:08, Iuliana Prodan <iuliana.prodan@nxp.com> wrote:
>
> On 9/2/2020 6:05 PM, Krzysztof Kozlowski wrote:
> > Fix kerneldoc warnings:
> >
> >    drivers/crypto/caam/caamalg_qi2.c:73: warning: cannot understand function prototype: 'struct caam_ctx '
> >    drivers/crypto/caam/caamalg_qi2.c:2962: warning: cannot understand function prototype: 'struct caam_hash_ctx '
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> This LGTM, but, while here, can you, please, check the other kernel-doc
> warnings:
> drivers/crypto/caam/ctrl.c:449: warning: Function parameter or member
> 'ctrl' not described in 'caam_get_era'
> drivers/crypto/caam/jr.c:331: warning: Function parameter or member
> 'rdev' not described in 'caam_jr_free'
> drivers/crypto/caam/jr.c:369: warning: Excess function parameter
> 'status' description in 'caam_jr_enqueue'
> drivers/crypto/caam/caamalg_desc.c:387: warning: Function parameter or
> member 'geniv' not described in 'cnstr_shdsc_aead_decap'

Sure, I'll take a look.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
