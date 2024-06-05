Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF58FCA82
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jun 2024 13:35:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B506FC71288;
	Wed,  5 Jun 2024 11:35:00 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFC63C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jun 2024 11:34:52 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AD8E2881A2;
 Wed,  5 Jun 2024 13:34:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717587292;
 bh=iqglW2Mm+Bj8XtbT2EuhNDhxfDBq1NKS+bPZOCk1k/M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aXouZorunfwKW3IpK7uZ6XI0TIPRnMaB9HbgvMmZi84dx2a77+9IXllJHblzvKQNR
 9befSOqfsGLjfuCSEe5I4zmW3bl5y0uvj4NBCQf0enrv5GVAs+Hgy5BQ+d7KgiUOnY
 Z61YPhvRUWU+3XAlzYfE3bJWBE/dX8byyiygIaj7+SWe1Zx0O/2j11AXVUv3KVrnYs
 43vEx4F5ud9Fu2LZoaCY4EcuQM+Nzrb1zlvghvXfG7tvedW19ZByxD9mGRDu6qojFD
 e2Q79XD+CdoXEZoegNBshFE3cZtSQRJWyvDqjuoS5V9Vtp/Fi9Rdi8Tp0ufytD6Zte
 yGkwah2Ni3WPQ==
Message-ID: <e9dc0291-f765-4796-b0ff-7c60b35adb4b@denx.de>
Date: Wed, 5 Jun 2024 12:57:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe ROULLIER <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240604143502.154463-1-christophe.roullier@foss.st.com>
 <20240604143502.154463-11-christophe.roullier@foss.st.com>
 <c2242ba3-3692-4c5f-a979-0d0e80f23629@denx.de>
 <3a59b4cc-0c7b-47d6-8322-4ae12ddb3a4c@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <3a59b4cc-0c7b-47d6-8322-4ae12ddb3a4c@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 10/11] ARM: dts: stm32: add ethernet1
 for STM32MP135F-DK board
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

On 6/5/24 8:00 AM, Christophe ROULLIER wrote:
> 
> On 6/4/24 18:52, Marek Vasut wrote:
>> On 6/4/24 4:35 PM, Christophe Roullier wrote:
>>> Ethernet1: RMII with crystal
>>> PHY used is SMSC (LAN8742A)
>>
>> Doesn't the STM32MP135F-DK come with two ethernet ports ?
>> Why not enable both ?
> 
> Hi Marek,
> 
> As already discussed in V2, second ethernet have no cristal and need 
> "phy-supply" property to work, today this property is managed by 
> Ethernet glue, but
> 
> should be present and managed in PHY node (as explained by Rob). So I 
> will push second Ethernet in next step ;-)

Please add that ^ information into the commit message.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
