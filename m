Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4C97AD486
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Sep 2023 11:32:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0F10C6B462;
	Mon, 25 Sep 2023 09:32:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39330C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Sep 2023 09:32:27 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38P5uba5003009; Mon, 25 Sep 2023 11:32:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=L9Mnpa4+g7dTSm97b0VFVROey4sO9ITBMYDsUb3JsoQ=; b=uQ
 BeX3r2oK6VRXJjfwWadu2QotZlQNii8Gwrx2fcJDHF/6O/DMrWwZ5u2xP7CgggHQ
 1MZPtvm+u3XRo5dBoIiWaeHdwjx9IAE10eJj7vv3OOboCVWsWDCRjKgaciuwZyL+
 CxL6RHw1iYqyJVBAXvdUcWACyDQ/hXB+NH7pNl57Z7szvmlSG7Ve4LQrsvTcBtB8
 GNo5CdK0mEnnK6zj2+92RvDpNPoqsD7EojxPpyrzL5N+jti3a6+AC7PQv1+ISptX
 BZNG2USai80ICO3rQJgYHi3emwBowkmRnVF9Naxsd5z89fiEweSTyXASrk6LNXxr
 Ib7mVYQRwrOsZlPKyVXA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9nefetsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Sep 2023 11:32:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D981B10005C;
 Mon, 25 Sep 2023 11:31:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D0F3421ED4C;
 Mon, 25 Sep 2023 11:31:54 +0200 (CEST)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 25 Sep
 2023 11:31:54 +0200
Message-ID: <9b81c8aa-e43d-18db-bc0c-4ae05c4d22bb@foss.st.com>
Date: Mon, 25 Sep 2023 11:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Kamlesh Gurudasani <kamlesh@ti.com>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230921080301.253563-1-gatien.chevallier@foss.st.com>
 <20230921080301.253563-10-gatien.chevallier@foss.st.com>
 <8734z6hb5i.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <8734z6hb5i.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_04,2023-09-21_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [EXTERNAL] [PATCH v3 9/9] ARM: dts: stm32: add
 RNG node for STM32MP13x platforms
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

Hi Kamlesh,

On 9/22/23 10:20, Kamlesh Gurudasani wrote:
> Gatien Chevallier <gatien.chevallier@foss.st.com> writes:
> 
>> The RNG on STM32MP13 offers upgrades like customization of its
>> configuration and the conditional reset.
>>
>> The hardware RNG should be managed in the secure world for but it
>> is supported on Linux. Therefore, is it not default enabled.
> Just curious, will there be concurrent access? If yes, how do you manage
> the entropy in that case?
> 

Any read on the data register leads to its refreshment. There can be
only one access at a time at the bus level. The rest (FIFO is empty
after request, etc...) is managed by the code in this patchset.

> If you allow access to RNG from normal world, can attacker change the
> setting to generate more predicatable numbers leading this to secure
> world as well.
> 
> I understand that you're leaving the enablement part to customer but
> you still have to allow RNG access to normal world for that.
> 
> -Kamlesh

If RNG is secure, then it should be managed by the secure world and
accessed via some interface. Ours is OP-TEE RNG PTA. The secure level
of the peripheral is managed by the ETZPC, which manages the security
configuration of the board's peripherals.

If the RNG is assigned to the non-secure world, then yes, the non-secure
world can access the RNG configuration. Now, your question is: what
happens to the secure world in such case? The answer is that it should
run on a pseudo-random software RNG seeded at boot by the hardware RNG.
So there's no link anymore if non-secure world deteriorates the
hardware RNG configuration.

Of course, if such choice is made, it's up to the customer to see the
whole picture.

Best regards,
Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
