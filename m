Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 081EC1B275
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 11:13:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5127EC0DB1E
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 09:13:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03C94C0DB1D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 09:13:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4D9Crjs028859; Mon, 13 May 2019 11:13:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=IWhtElWmdpgKIU8VGl5G2wFIivmrFZHb3+vkvkOzBGA=;
 b=E6iQyyyNDLealIRBDwwE1PJRXet68DzmjV/MzkkvfL7fEnyvVlT1Qo6UAOQyNfFgbywo
 wh0HHkKmexaCwPl0x4409KMWbQbXOQhe8G62Bp7kPUrQb77X1/YnJgavAMad4vxRWPOD
 Rf5AORgARCAky3RE/pXkqL4NFa42RPpYl8DnzkEhZAv0s99NHpDC555Sy5rvZxDoXFFm
 +KDcCuHxPU+o4az8B43kmydkb3nPK51goWLVvBD3VfAtR0JV2iN+xJSPYSewY8dCMOpk
 5uhbUZORK7+hNSoOPM72zj1ksuNuiDrg9HlduGf59TP5ol/1kSn5r6e3jNqVJLnRZrZ2 mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sdn9fhywd-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 13 May 2019 11:13:14 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C44BF31;
 Mon, 13 May 2019 09:13:12 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DB691651;
 Mon, 13 May 2019 09:13:12 +0000 (GMT)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 13 May
 2019 11:13:12 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1347.000; Mon, 13 May 2019 11:13:12 +0200
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>
Thread-Topic: [PATCH v2 0/6] hwspinlock: allow sharing of hwspinlocks
Thread-Index: AQHU+0e1QzNWA48760KM6GhFSHX8FaZowBIA
Date: Mon, 13 May 2019 09:13:11 +0000
Message-ID: <25aae4ca-0568-ccaf-0c47-4f5f4e2e8599@st.com>
References: <1556183843-28033-1-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1556183843-28033-1-git-send-email-fabien.dessenne@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <D55BFC742E8B3D4FAB756D29EDD9858A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-13_06:, , signatures=0
Cc: Fabien DESSENNE <fabien.dessenne@st.com>
Subject: Re: [Linux-stm32] [PATCH v2 0/6] hwspinlock: allow sharing of
	hwspinlocks
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

Hi


I Got Rob's Reviewed-by. Any further comments?


Fabien


On 25/04/2019 11:17 AM, Fabien Dessenne wrote:
> The current implementation does not allow two different devices to use
> a common hwspinlock. This patch set proposes to have, as an option, some
> hwspinlocks shared between several users.
>
> Below is an example that explain the need for this:
> 	exti: interrupt-controller@5000d000 {
> 		compatible = "st,stm32mp1-exti", "syscon";
> 		interrupt-controller;
> 		#interrupt-cells = <2>;
> 		reg = <0x5000d000 0x400>;
> 		hwlocks = <&hsem 1>;
> 	};
> The two drivers (stm32mp1-exti and syscon) refer to the same hwlock.
> With the current hwspinlock implementation, only the first driver succeeds
> in requesting (hwspin_lock_request_specific) the hwlock. The second request
> fails.
>
>
> The proposed approach does not modify the API, but extends the DT 'hwlocks'
> property with a second optional parameter (the first one identifies an
> hwlock) that specifies whether an hwlock is requested for exclusive usage
> (current behavior) or can be shared between several users.
> Examples:
> 	hwlocks = <&hsem 8>;	Ref to hwlock #8 for exclusive usage
> 	hwlocks = <&hsem 8 0>;	Ref to hwlock #8 for exclusive (0) usage
> 	hwlocks = <&hsem 8 1>;	Ref to hwlock #8 for shared (1) usage
>
> As a constraint, the #hwlock-cells value must be 1 or 2.
> In the current implementation, this can have theorically any value but:
> - all of the exisiting drivers use the same value : 1.
> - the framework supports only one value : 1 (see implementation of
>    of_hwspin_lock_simple_xlate())
> Hence, it shall not be a problem to restrict this value to 1 or 2 since
> it won't break any driver.
>
> Changes since v1:
> * Removed useless 'status = "okay"' from stm32mp157c.dtsi
>
> Fabien Dessenne (6):
>    dt-bindings: hwlock: add support of shared locks
>    hwspinlock: allow sharing of hwspinlocks
>    dt-bindings: hwlock: update STM32 #hwlock-cells value
>    ARM: dts: stm32: Add hwspinlock node for stm32mp157 SoC
>    ARM: dts: stm32: Add hwlock for irqchip on stm32mp157
>    ARM: dts: stm32: hwlocks for GPIO for stm32mp157
>
>   .../devicetree/bindings/hwlock/hwlock.txt          | 27 +++++--
>   .../bindings/hwlock/st,stm32-hwspinlock.txt        |  6 +-
>   Documentation/hwspinlock.txt                       | 10 ++-
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi          |  2 +
>   arch/arm/boot/dts/stm32mp157c.dtsi                 |  9 +++
>   drivers/hwspinlock/hwspinlock_core.c               | 82 +++++++++++++++++-----
>   drivers/hwspinlock/hwspinlock_internal.h           |  2 +
>   7 files changed, 107 insertions(+), 31 deletions(-)
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
