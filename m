Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9845A5D95
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Aug 2022 10:02:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 860B5C5EC6B;
	Tue, 30 Aug 2022 08:02:03 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71D91C03FD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 08:02:02 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id cu2so20539463ejb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 01:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ydfrnuw+55leI10v9SJBVImy0rWUjcTdkZR1kZGXwFw=;
 b=sV10+81KoPuDshXkyNnytQlWEOMWBRHltUXPpfM+CplmDPQ8kLuNBkE5vTYRXXjObI
 uoooAue7myXVu5RhSIviJXqZhc8Ojv3qJgDvIBjRZ3DLGov5jyyfdjJ6+QQgpk4ZEUnz
 TJCv/1NTQgEyCVPlgYRsGa0s+4WQsG//Ubvsl1LanrY5DWjAV4/1LAPePTrL6Eb4vFho
 PoRDek7uFeueJCXKxNVGALUHcLMNIgVAjP8K0+UINpGktv5hRenimM/HV0BkZpn67ooe
 v5V2V0yaECFq/Xt0j4wnX/vLXbnyrtxzMkoI7qOmNgLWW4rTytbefy9IuBxRjBPALC1y
 LH8g==
X-Gm-Message-State: ACgBeo1jFRcWFRsQgn9Oq8ghT5n3LbmOuxxDU21aDAz0wy2HOa3PHZuI
 nX/nDjkSR6gaMJ4ursAk8+0=
X-Google-Smtp-Source: AA6agR5gDrSS4cPDXB6O0pPRBT0lOuKdfVV/ExsAVlNsE2XddNhK40qAq02POdSU0t1LhaH7OI+8WQ==
X-Received: by 2002:a17:906:ee89:b0:73d:70c5:1a4e with SMTP id
 wt9-20020a170906ee8900b0073d70c51a4emr15397045ejb.683.1661846522007; 
 Tue, 30 Aug 2022 01:02:02 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a056402094300b00445e037345csm6832470edz.14.2022.08.30.01.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 01:02:01 -0700 (PDT)
Message-ID: <1068ad37-d80c-6e63-6cd9-6ecf6c256d46@kernel.org>
Date: Tue, 30 Aug 2022 10:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-serial@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Russell King <linux@armlinux.org.uk>,
 Richard Genoud <richard.genoud@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20220830072956.3630-1-ilpo.jarvinen@linux.intel.com>
 <20220830072956.3630-5-ilpo.jarvinen@linux.intel.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220830072956.3630-5-ilpo.jarvinen@linux.intel.com>
Cc: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Subject: Re: [Linux-stm32] [PATCH v2 4/4] serial: Add kserial_rs485 to avoid
 wasted space due to .padding
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMzAuIDA4LiAyMiwgOToyOSwgSWxwbyBKw6RydmluZW4gd3JvdGU6Cj4gLS0tIGEvaW5jbHVk
ZS9saW51eC9zZXJpYWxfY29yZS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9zZXJpYWxfY29yZS5o
Cj4gQEAgLTMxLDYgKzMxLDI5IEBAIHN0cnVjdCBzZXJpYWxfc3RydWN0OwouLi4KPiArICogTXVz
dCBtYXRjaCB3aXRoIHN0cnVjdCBzZXJpYWxfcnM0ODUgaW4gaW5jbHVkZS91YXBpL2xpbnV4L3Nl
cmlhbC5oIGV4Y2x1ZGluZwo+ICsgKiB0aGUgcGFkZGluZy4KCkhhdmUgeW91IGNvbnNpZGVyZWQg
QlVJTERfQlVHX09OKCkgY2hlY2tzIHdpdGggZmV3IG9mZnNldF9vZigpcyB0byAKZW5mb3JjZSB0
aGUgYWJvdmU/Cgo+ICtzdHJ1Y3Qga3NlcmlhbF9yczQ4NSB7Cj4gKwlfX3UzMglmbGFnczsKPiAr
CV9fdTMyCWRlbGF5X3J0c19iZWZvcmVfc2VuZDsKPiArCV9fdTMyCWRlbGF5X3J0c19hZnRlcl9z
ZW5kOwo+ICsJc3RydWN0IHsKPiArCQlfX3U4ICAgIGFkZHJfcmVjdjsKPiArCQlfX3U4ICAgIGFk
ZHJfZGVzdDsKPiArCX07Cj4gK307Cgp0aGFua3MsCi0tIApqcwpzdXNlIGxhYnMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
