Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C133F24C25C
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 17:39:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D872C32E8F;
	Thu, 20 Aug 2020 15:39:29 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA5A5C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 15:39:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f18so4031916wmc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 08:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MhLvoz6dN7urYtcgesShmUyNKBoosukHj2muJjGd/2U=;
 b=SLlHtxbqtVOQ0uxqWJ4QIokFUJ5Yra5+VFPz5BITRGW6+jaokJMv4xLgMJ4leC+2Dp
 q2C2GAghLgH6zT11xWetBIUas6tLLDMYFrtYxIouq0mWrLb7JhQWE4M6r9sQTIT0KwuO
 +NFX4sekBBTXtrDlYZKfsRcPkEMdp0JdA3z/U6VM0db6pGxXClyJ0mC4jpC/mESqhEHa
 t7vE30YryiiOO00vbSQYHMcFiB88OBtm2EOwjlSE6R0UgmT9gm+waxApPhNodHGmUgC1
 Sm4/DPoWnJxd7z2Bj4bLlGOrDAmuFnMXR3XjO4lhSMB2N9rg149Hg/EEK6M9T7vdYGvt
 VuSA==
X-Gm-Message-State: AOAM531vasUBGaMP6e77gXBEG+x2WCfQekTKnhLJd1WYilzClnRu7zet
 g4sXck62tjaIQQxxZnEYkDs=
X-Google-Smtp-Source: ABdhPJxAr5SjwRUJhKexQUTUi0ZBWPwxg3/wvl0ag4Ol1A286zSvpoLoAailuRwcb3/C7oxhjJmTew==
X-Received: by 2002:a7b:c845:: with SMTP id c5mr4151981wml.180.1597937967176; 
 Thu, 20 Aug 2020 08:39:27 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id z207sm5029545wmc.2.2020.08.20.08.39.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Aug 2020 08:39:26 -0700 (PDT)
Date: Thu, 20 Aug 2020 17:39:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200820153923.GA17410@kozik-lap>
References: <20200806181932.2253-1-krzk@kernel.org>
 <20200806182059.2431-1-krzk@kernel.org>
 <159783932455.55025.7979458249415199743.b4-ty@kernel.org>
 <20200819190232.GA18183@kozik-lap>
 <20200819191722.GA38371@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819191722.GA38371@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Kukjin Kim <kgene@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 01/41] ARM: s3c: Remove unneeded
 machine header includes
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

On Wed, Aug 19, 2020 at 08:17:22PM +0100, Mark Brown wrote:
> On Wed, Aug 19, 2020 at 09:02:32PM +0200, Krzysztof Kozlowski wrote:
> 
> > Thanks Mark.  Could you provide me with a tag/branch with these to pull
> > into samsung-soc?
> 
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:
> 
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/samsung-platdrv-boards
> 
> for you to fetch changes up to dcacbc0f9bb89ac48d5b602d27a8630e641294cc:
> 
>   ASoC: samsung: s3c2412-i2s: avoid hardcoded S3C2410_PA_IIS (2020-08-19 20:15:45 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Convert Samsung drivers to platform drivers

Thanks, merged into samsung-soc.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
