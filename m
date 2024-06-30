Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AC391D019
	for <lists+linux-stm32@lfdr.de>; Sun, 30 Jun 2024 07:24:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DC5DC71282;
	Sun, 30 Jun 2024 05:24:10 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBF13C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jun 2024 05:24:02 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1BE3388607;
 Sun, 30 Jun 2024 07:24:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719725042;
 bh=M1pxPkW8agAdfniQmy08fGahbeILY9IeJg5Ga0QGsto=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QdQsgqs5j7QciIxh+WVZNq9d2KDO/GyiYp6mRf4TD6QaHapsQVWympYPSLkZyDopB
 QVcfyCYoAKmwLpKm/xnDcbc2CedoGuk/6lcwcHmmnovAooWJ4aBxuaj9ZQiP/dYZEn
 8bbzt6C48eKiWmYhRXvBexiP88vRSm6ccg6zM5RqBWXhJkkGoOjq8Q3JMN9Ia4vifw
 05ZlrHGJ/K6WNsInGqISg3edJvEFVUA5pZ63NXIgo8ZhyU5/6MyixdsNxle1OaVLxX
 +hWLcw4S5RSAgHcBlr9wg1TFydisQSSbEqDwrTMGG6MUlD8EGG+UqaP1lw373C1P3v
 xjqMRSObow7PA==
Message-ID: <bb770342-8a55-4cb5-81dc-d8b1aebac607@denx.de>
Date: Sun, 30 Jun 2024 03:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240628005729.119871-1-marex@denx.de>
 <04d2ef05-4f47-445c-8f5c-1e550ef5aff2@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <04d2ef05-4f47-445c-8f5c-1e550ef5aff2@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] ARM: dts: stm32: Add ethernet support
 for DH STM32MP13xx DHCOR DHSBC board
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

On 6/28/24 8:44 AM, Alexandre TORGUE wrote:
> Hi Marek

Hi,

> On 6/28/24 02:57, Marek Vasut wrote:
>> Add ethernet support for the DH STM32MP13xx DHCOR DHSBC carrier board.
>> This carrier board is populated with two gigabit ethernet ports and two
>> Realtek RTL8211F PHYs, both are described in this DT patch.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> I already applied series which add the ETH support in mp13 DH board. Can 
> you please resend a patch which only add the nvmem efuse stuff please ?

Done in [PATCH] ARM: dts: stm32: Add ethernet MAC nvmem cells to DH 
STM32MP13xx DHCOR DHSBC board .
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
