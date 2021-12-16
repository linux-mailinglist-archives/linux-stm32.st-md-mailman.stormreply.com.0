Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A588476D26
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 10:14:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21EC9C5E2C5;
	Thu, 16 Dec 2021 09:14:49 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE925C5E2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 09:14:47 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 36F7181184;
 Thu, 16 Dec 2021 10:14:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1639646087;
 bh=4KGuTwhojZAMWLlAy5DjgLUqaT2ZYVoaf+TvkydJd6g=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Ry1NwOreBD5Fe9kQOZopFc9TvTpmrIth2ygVZpeDfr6aTJx1VpTSKFVDxhmdMHb/4
 TcrlwAE8nzgtFB+okKjLeukYCAh2I8v+jPXVXXrjZsxvC1so8XiJRXgZv3ha4e6IN+
 1FwibcMnBppdrAl5dMInx4KoVz8VHCWVUB/wTXbNNmQyYgHO82aVf1RKJz0LBjDy8E
 fTniyOFhZof+egJs8XoT5h6580xX6qpGop+ROnMIyUHq9VOhL0ki9jkTsqnkGHEi5f
 S18AscO+GQJ85tpuHBu4LEto9Tkcuvfnp1kUSRl7Y7QmWreKz/Itq4xX302Ya9SL+v
 jZ1q1G+adstkQ==
Message-ID: <c4528bc5-a826-a4ed-c4d6-e0ab84651ea2@denx.de>
Date: Thu, 16 Dec 2021 10:14:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Yann Gautier <yann.gautier@foss.st.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>,
 u.kleine-koenig@pengutronix.de,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Ludovic Barre <ludovic.barre@foss.st.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20211215141727.4901-1-yann.gautier@foss.st.com>
 <20211215141727.4901-5-yann.gautier@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20211215141727.4901-5-yann.gautier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Subject: Re: [Linux-stm32] [PATCH 4/4] mmc: mmci: add hs200 support for
	stm32 sdmmc
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 12/15/21 15:17, Yann Gautier wrote:
> Use feedback clock for HS200 mode, as for SDR104.
> The HS200 mode can be enabled through DT by using mmc-hs200-1_8v.
> It is possible to use it on STM32MP13, but not STM32MP15 platforms.

HS200 is possible even on the MP15, it just doesn't yield any 
(performance) benefits due to the slower bus clock (125 MHz or so?), so 
it isn't worth enabling it on MP15. It is nice to see MP13 can do better.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
