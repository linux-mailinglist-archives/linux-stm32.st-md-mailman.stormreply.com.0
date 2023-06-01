Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1354F71F3E2
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Jun 2023 22:32:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2A28C6A61E;
	Thu,  1 Jun 2023 20:32:19 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DB03C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jun 2023 20:32:19 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 84854862D0;
 Thu,  1 Jun 2023 22:32:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685651538;
 bh=AK9VM70TADXJgbWRfDlF3HDtrVkMIteUeHxrQkzA16A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IcMCF7o+F2UgoVjdkE5faJIArtY/hCwYh5iuxpH0t6mxZqluA8mLv525J/OXerd7Z
 DBnQ2258DsThcs8vm4ML8CJzBxAcKVMvbFZcX4asCBSW1Mi1U1tiyATisYWwHABrMq
 8aKm7SOSRbeYQhiLjQaqrauQfF4HNNlIpW85kVmZ2ti0fSzWBqWITfn4JW3VuU60fh
 rCV96wx6k+XksZEdhn36ZMUqWCx7RcHAE8EFj89eV+CpKwg3niqQyFAqPnzo5uMSnA
 vv3e5JbCJgVTvL/WRNpQXwl4DZm1/klKeRoWpYkSyC12r/8g+rjIR3+D8RxNOtATW7
 MAwc30VUXXrcQ==
Message-ID: <94a89ca7-bc29-5a2e-f99d-9b2577882c92@denx.de>
Date: Thu, 1 Jun 2023 22:32:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 linux-arm-kernel@lists.infradead.org,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 yannick Fertre <yannick.fertre@foss.st.com>
References: <20230531231044.574541-1-marex@denx.de>
 <b343ab21-2787-4602-57f8-4c2bf62db523@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <b343ab21-2787-4602-57f8-4c2bf62db523@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Deduplicate DSI node
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

On 6/1/23 18:46, Raphael Gallais-Pou wrote:
> Hi Marek,

Hi,

> On 6/1/23 01:10, Marek Vasut wrote:
>> All boards using the DSI node duplicate the same pattern common pattern
>> in board DTs, that pattern is ports with endpoint labels and the same
>> in-SoC regulator connection. Move that common pattern into stm32mp157.dtsi
>> instead.
> 
> I think that is a good idea, while it did not crossed my mind implementing it
> this way on the first time.
> 
> I'll let my peers Philippe and Yannick review and ack it this time. I tested it
> on DK2, it seems fine.

Thanks for testing. There's no rush, so take your time.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
