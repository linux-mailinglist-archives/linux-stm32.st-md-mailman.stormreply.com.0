Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6C879C84C
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 09:37:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB26CC6B46E;
	Tue, 12 Sep 2023 07:37:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4879C6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 07:37:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38C3LwsM015420; Tue, 12 Sep 2023 09:37:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=HqbaF5o1SFYteMShhADVnqO2ykmpSHq+NUsm7vDvMjw=; b=UA
 VWktBUSVoWOMkewhc/t2KW0oyNHSGb1NjrqChWrmoejwoivtrnMHIGVlEe/3RJdz
 qXv+2mJj9xYLCALx5shCbNnSZjAULf8Nt7KLgxE0JosCuDfB6auAkHKnLjyhZgdN
 0W/8pj+1u8Hoh1ga+gVF9nap5TMw1hWlN9Szf93mec8aczvIe5RnX63l3hasyHNi
 diYZTtKWNh9sS9WePf/3mzUzKlq6UbzB2EXt6CMLePwfMY3LBNxvuz4fI28EUlq1
 4np1BGVN6x2TVVdJ0SUMKVGlZcSN2MbFi3MOKaZk3Z3khnOjJezAzzB3iEuMq8rn
 1aOTGFGJqsik3ZTQwNPQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t0fkcmfh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Sep 2023 09:37:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D0472100058;
 Tue, 12 Sep 2023 09:37:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C6C4721ED32;
 Tue, 12 Sep 2023 09:37:01 +0200 (CEST)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Sep
 2023 09:37:01 +0200
Message-ID: <f8445beb-52a0-bcb8-f4fa-3decdfde09fc@foss.st.com>
Date: Tue, 12 Sep 2023 09:36:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To: Herbert Xu <herbert@gondor.apana.org.au>
References: <20230908165120.730867-1-gatien.chevallier@foss.st.com>
 <20230908165120.730867-6-gatien.chevallier@foss.st.com>
 <ZP/iw6jvHrlBavdK@gondor.apana.org.au>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <ZP/iw6jvHrlBavdK@gondor.apana.org.au>
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_04,2023-09-05_01,2023-05-22_02
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/10] hwrng: stm32 - rework error
 handling in stm32_rng_read()
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

Hello Herbert,

On 9/12/23 06:02, Herbert Xu wrote:
> On Fri, Sep 08, 2023 at 06:51:15PM +0200, Gatien Chevallier wrote:
>>
>> +			if (WARN_ON(sr & RNG_SR_CEIS), "RNG clock too slow - %x\n", sr)
> 
> Introducing an unconditional WARN_ON is not acceptable.  If you
> really need it, make it WARN_ON_ONCE.  But why does this need
> to be a WARN instead of dev_err?
> 
> Cheers,

It was my mistake and not my intention to change the WARN_ON_ONCE to a
WARN_ON. I've already sent a V2 correcting this.

It was already a WARN_ON_ONCE on the first implementation of the driver.
This is not an unrecoverable error as it doesn't affect the quality of
the entropy delivered by the RNG. The output is just too slow. It's here
to warn the developer of an incorrect clock source setting.

Best regards,
Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
