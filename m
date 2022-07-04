Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0E9564E05
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jul 2022 08:56:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60EB4C640F4;
	Mon,  4 Jul 2022 06:56:07 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A98D7C03FE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 06:56:06 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id d2so15068947ejy.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Jul 2022 23:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=sLZxcn/mwX9NSWhtBrUUwKBfPIOzguHlMVriisP3s50=;
 b=eDBwywtIj+tn492hEqSgt+jOXBCRx9v2+JBBoqedOOehJx6XiZdkKBbqMjjqXdI1Xd
 AYO1yUmMsHmPS7ivXq2qDKTIz7RzZoFS6/2fH0azqs8ksRrqm5+A7Ix6VaK9cluKPM5f
 oA8N6pEpi++vK4FRiTbgmhCXrtr+6zT+2vNuXLFhFHhSnBxP8AP/DYDQ9X7e99Lkt+80
 tORZz0Txeq9N9LDas5jqcICJ7+9BlGHbpCYteXf0kXeUsH+PSYz/hm1XhrwDhrVXQbI5
 IvSvhsrw8UiFuMStl/e/yV6OjsYNzIIG38c5hhz4hSue5ZtlV2hH+B+mYQ/DW1uH2XE6
 HIow==
X-Gm-Message-State: AJIora8GJ+R0dwE5scyZxwDX8XTrAuwq3uI8s+uTvq7qklpWtHD4v84l
 +SMTdr5lwVkex9+G0hF0KfM=
X-Google-Smtp-Source: AGRyM1uwNoj8eGbBYscqhKNT3kl/EICy8stzzbFwhI67Gi9CQ9Ux4HU0BLwYn9CX17sMulpmdbgQ5w==
X-Received: by 2002:a17:907:6d86:b0:726:99d7:20e4 with SMTP id
 sb6-20020a1709076d8600b0072699d720e4mr27177070ejc.342.1656917766291; 
 Sun, 03 Jul 2022 23:56:06 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a056402128e00b004356894a3f8sm20136747edv.89.2022.07.03.23.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 23:56:05 -0700 (PDT)
Message-ID: <06e40c1c-d8e3-b1c1-276a-e32e579371b8@kernel.org>
Date: Mon, 4 Jul 2022 08:56:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>,
 Richard Genoud <richard.genoud@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20220624204210.11112-1-ilpo.jarvinen@linux.intel.com>
 <20220624204210.11112-5-ilpo.jarvinen@linux.intel.com>
 <60678c81-27bf-6f37-bae5-ccc91d714204@kernel.org>
In-Reply-To: <60678c81-27bf-6f37-bae5-ccc91d714204@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v9 4/6] serial: take termios_rwsem for
 ->rs485_config() & pass termios as param
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

On 04. 07. 22, 8:51, Jiri Slaby wrote:
> Anyway, I'm not sure I buy the above. Why is termios_rwsem needed to 
> alter ADDRB?

Nevermind, reading patch 5/6 gives a clue.

-- 
js
suse labs
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
