Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADBA570195
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jul 2022 14:03:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5B25C640F0;
	Mon, 11 Jul 2022 12:03:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6330C640EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 12:03:12 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26B9JJwa001519;
 Mon, 11 Jul 2022 14:03:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WJZnOU8KB28lNH44i8wmE7STh4UGU33tGuVrwz8xG84=;
 b=nYo1mLk1rIfvJkPwaDTc7XBd23Bmv01vqD30eHd5jYsimitwOm52nF9a3zkhjXFAwiR+
 Ytwc7jL3NIDO4dM4RNyZI2CeIcOiRoUm8iU7zaJ9JYVA2QXHvMi2MuHLjrvAQzhRPUwZ
 Vq1WnOUxTQehG3tojsux/vDgIEPCl4MU2KRKiAYG4J++7OBemna6PwxZ+MRdUNCbo2RO
 JwJSmGxGKRVWzFR0/tNQ48WceDtqISheVDkzzzVK+A7HR44o0Oj6jJs8Yf7rVfYJ5jRV
 hXzOB2lDU21pNR7snRbLx2GfUSvxr6UyYEXfWWD3V5ZV1J9lhBF1SXQzsODxO+f9Ynuz 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h6y3mu6sg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 14:03:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D97AA10002A;
 Mon, 11 Jul 2022 14:03:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D437421ED30;
 Mon, 11 Jul 2022 14:03:04 +0200 (CEST)
Received: from [10.48.1.102] (10.75.127.50) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 11 Jul
 2022 14:03:03 +0200
Message-ID: <b8297d50-99e0-ef42-473d-a1167d46276e@foss.st.com>
Date: Mon, 11 Jul 2022 14:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
 <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
References: <20220711114831.25205-1-fabrice.gasnier@foss.st.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20220711114831.25205-1-fabrice.gasnier@foss.st.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_17,2022-07-08_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 0/4] usb: typec: ucsi: add support for
	stm32g0
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

Hi all,

I just resent the full series as I got some issues with my mailer.
Sorry for the noise, please drop this one.

Best Regards,
Fabrice

On 7/11/22 13:48, Fabrice Gasnier wrote:
> STM32G0 provides an integrated USB Type-C and power delivery interface [1].
> It can be programmed with a firmware [2] to act as a PPM. Currently it
> implements UCSI protocol over I2C interface. A GPIO is used as an interrupt
> line.
> 
> This series adds a driver to support it, including:
> - dt-bindings documentation
> - optional STM32G0 firmware control and update, over a secondary I2C address
> - power management
> 
> [1] https://wiki.st.com/stm32mcu/wiki/Introduction_to_USB_Power_Delivery_with_STM32
> [2] https://github.com/STMicroelectronics/x-cube-ucsi
> 
> Changes in v2:
> - Krzysztof's review comments on dt-bindings: update commit message, use ports,
>   use unevaluatedProperties: false for usb-connector schema, define maxItems
>   for power-domains, adopt generic node names, remove quotes.
> - Christophe's comments on driver:
>   use kmalloc instead of kzalloc
>   Use-after-free of buf: directly print the offset
> 
> Fabrice Gasnier (4):
>   dt-bindings: usb: typec: add bindings for stm32g0 controller
>   usb: typec: ucsi: stm32g0: add support for stm32g0 i2c controller
>   usb: typec: ucsi: stm32g0: add bootloader support
>   usb: typec: ucsi: stm32g0: add support for power management
> 
>  .../bindings/usb/st,typec-stm32g0.yaml        |  90 ++
>  drivers/usb/typec/ucsi/Kconfig                |  10 +
>  drivers/usb/typec/ucsi/Makefile               |   1 +
>  drivers/usb/typec/ucsi/ucsi_stm32g0.c         | 777 ++++++++++++++++++
>  4 files changed, 878 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/st,typec-stm32g0.yaml
>  create mode 100644 drivers/usb/typec/ucsi/ucsi_stm32g0.c
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
