Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BC61F92CC
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2020 11:09:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1497AC36B11;
	Mon, 15 Jun 2020 09:09:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A460FC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 09:09:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F93vZX011755; Mon, 15 Jun 2020 11:08:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=6AGPKZTlObc1ZPKgs7FhyKVk6uWShOigJZrNQVvB/pQ=;
 b=PhelqSKTVsO9nZgxPwkhPrpVsE6gksTSuihQPK4G/z2nVgsBkuC4x58ewVjROKixHJ+C
 W/4HBioio2gBS1c8S4MtZnCBLt05dArjTqB4g2zoZNivZMxri3hLhpEzw6k7btE0Uvh1
 enZ56vrKTX5EdVl3HYI/E+Xvd+8rpBjQ/i58kX6S+UCHcMWZW1mzTeecE5Vx9ngJTgEu
 O129wBWbL0/d2uzLwXvkXi0gJsQau8l59g74IMwVilDzwSEr0LaCFjP1/eCN6V6nQSVp
 ZkHSj3MAZn1RPHvcwhIic8Oct4dc4F/l0aFb0Dg1Te+nU+DlOUXtDy3RaYoyxus2Obqz AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mnph0hu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 11:08:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E3F4D100034;
 Mon, 15 Jun 2020 11:08:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1F1A2BE22D;
 Mon, 15 Jun 2020 11:08:48 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun
 2020 11:08:48 +0200
To: <dillon.minfei@gmail.com>, <robh+dt@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <p.zabel@pengutronix.de>,
 <pierre-yves.mordret@st.com>, <philippe.schenker@toradex.com>
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <618d3fea-aa9f-dbf6-04a1-e9db621a6cd5@st.com>
Date: Mon, 15 Jun 2020 11:08:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_01:2020-06-15,
 2020-06-15 signatures=0
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 0/4] Enable stmpe811 touch screen on
 stm32f429-disco board
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

Hi Dillon

On 6/9/20 3:26 PM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> This patchset is intend to enable stmpe811 touch screen on stm32f429-disco
> board with three dts and one i2c driver changes.
> 
> has been validated by ts_print tool
> 
> Changes log:
> V4: indroduce 'IIC_LAST_BYTE_POS' to compatible with xipkernel boot
> 
> V3: just add change log in [PATCH V3 3/4] below ---
> 
> V2: remove id, blocks, irq-trigger from stmpe811 dts
> 
> V1:
> ARM: dts: stm32: add I2C3 support on STM32F429 SoC
> ARM: dts: stm32: Add pin map for I2C3 controller on stm32f4
> ARM: dts: stm32: enable stmpe811 on stm32429-disco board
> i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
> 
> dillon min (4):
>    ARM: dts: stm32: add I2C3 support on STM32F429 SoC
>    ARM: dts: stm32: Add pin map for I2C3 controller on stm32f4
>    ARM: dts: stm32: enable stmpe811 on stm32429-disco board
>    i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
> 
>   arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 12 +++++++++
>   arch/arm/boot/dts/stm32f429-disco.dts  | 47 ++++++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32f429.dtsi       | 12 +++++++++
>   drivers/i2c/busses/i2c-stm32f4.c       | 12 ++++++---
>   4 files changed, 80 insertions(+), 3 deletions(-)
> 

DT patches applied on stm32-next. I changed node ordering in patch 3.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
