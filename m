Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E591B2297E9
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jul 2020 14:10:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0D22C36B29;
	Wed, 22 Jul 2020 12:10:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1081C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jul 2020 12:10:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06MC2OTE002090; Wed, 22 Jul 2020 14:09:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=vmdNwJ2HewNJLb/ngps5jILq7qbplk1hGoHXd/4wx9c=;
 b=eVIhmJTFr0bJmK4xQaclpzupG/RzTS98PjSvZWg1AYKan2EwyZHAKFAUT64zwIq1v7+Y
 fRhyDNJjSSbzUCTsDVyvqv6G46Ad9m1r2BYKO45XWiB4qQ8JswNJxbreqBCRXRH0IL8D
 H7emYCy1txezRsja1aQ+XNgXqgmL8ju+eeKe+viEO927B4/YrudVtC/V8lhkOAIEZ73d
 3FGHuRqsdpP7oww5oaevtuPtWNuvL5fX23UY7f2XPqWLqzs3iAoy9135b3Mv9hcCZCEf
 GLGosXeitedlugT4a9E7rlB1vHTWAl25OUPtDfi3Nn2DHOjh54+RbyW4bHRhWstt9iOU 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32cux0ejnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 14:09:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1DE34100034;
 Wed, 22 Jul 2020 14:09:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D95252AF323;
 Wed, 22 Jul 2020 14:09:52 +0200 (CEST)
Received: from [10.48.0.224] (10.75.127.46) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Jul
 2020 14:09:52 +0200
To: Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20200721185317.208722-1-marcin.sloniewski@gmail.com>
 <20200721185317.208722-3-marcin.sloniewski@gmail.com>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <73077407-e008-1ae2-266d-1045a73620ba@st.com>
Date: Wed, 22 Jul 2020 14:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200721185317.208722-3-marcin.sloniewski@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_05:2020-07-22,
 2020-07-22 signatures=0
Cc: Rob Herring <robh@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, allen <allen.chen@ite.com.tw>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 3/3] ARM: dts: stm32: add initial
 support for stm32mp157-odyssey board
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

Hello Marcin,

On 7/21/20 8:53 PM, Marcin Sloniewski wrote:
> +&sdmmc2 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
> +	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
> +	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +	st,neg-edge;
> +	bus-width = <4>;
> +	vmmc-supply = <&v3v3>;
> +	vqmmc-supply = <&v3v3>;
> +	mmc-ddr-3_3v;
> +	status = "okay";
> +};

Based on the pins muxed, 8 data lines are configured, but the bus width 
is set to 4. What is the reason of not setting this property to 8?

Regards,
Christophe Kerello.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
