Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC4543CB3E
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Oct 2021 15:57:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7407C5719C;
	Wed, 27 Oct 2021 13:57:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BB85C23E41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Oct 2021 13:57:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RD9TUg016081; 
 Wed, 27 Oct 2021 15:56:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SonikwPLivf5Wf37m9QGw9Dbl0nfvPwQE843HNWkcTc=;
 b=WzTh3e1T+lbbR0asJHNFou5wy8ymDy2S+R6rPJyrqAzstKAMap8J47xdHxMl2RgiS0FA
 GmPrGi2x3OeVUYtOCqe6mJeZ8Qnqgr3AqxOk450p67gxTAT52rOaRO+ShqQ7sCyKWJnI
 akk/0WBtQxfWvGvmNBBFHNJxGj2edblZplh16L99+Icve2UKQ3u0Y7rBt6zEBSDWSZG4
 hjGa2jeJcZtnU6/w30poOeFwKUFpEn8VYHXLg/vCxFZY0lY9ng2HR45n3c8vhiJwnllz
 Jwmg2Jsob0VeZLHlpEugPKm678F0Rb6n0r6pPAbgzUx5bSgYL/7OoJXo5clDxcl3kg2U lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3by38r22bq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 15:56:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5734910002A;
 Wed, 27 Oct 2021 15:56:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3742D22D168;
 Wed, 27 Oct 2021 15:56:39 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 27 Oct
 2021 15:56:35 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, <joe@perches.com>
References: <20211020065000.21312-1-patrice.chotard@foss.st.com>
 <22fb6f19-21eb-dcb5-fa31-bb243d4a7eaf@canonical.com>
 <878ryoc4dc.wl-maz@kernel.org>
 <82492eb2-5a5e-39a2-a058-5e2ba75323e0@foss.st.com>
Message-ID: <865a4055-5c2f-0793-bdce-9f04eac167d2@foss.st.com>
Date: Wed, 27 Oct 2021 15:56:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <82492eb2-5a5e-39a2-a058-5e2ba75323e0@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_04,2021-10-26_01,2020-04-07_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jassi Brar <jassisinghbrar@gmail.com>, Jose
 Abreu <joabreu@synopsys.com>, Guenter Roeck <linux@roeck-us.net>,
 ohad ben-cohen <ohad@wizery.com>, linux-pm@vger.kernel.org,
 Matt Mackall <mpm@selenic.com>, Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 david airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 thierry reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, lars-peter
 clausen <lars@metafoo.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-clk@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-gpio@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, stephen boyd <sboyd@kernel.org>,
 pascal Paillet <p.paillet@foss.st.com>,
 maxime coquelin <mcoquelin.stm32@gmail.com>,
 jonathan cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
 michael turquette <mturquette@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org, linux-mtd@lists.infradead.org, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 linux-phy@lists.infradead.org, sam ravnborg <sam@ravnborg.org>,
 linux-rtc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 baolin wang <baolin.wang7@gmail.com>, "david s . miller" <davem@davemloft.net>,
 Vignesh Raghavendra <vigneshr@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-remoteproc@vger.kernel.org,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 bjorn andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>,
 Marek Vasut <marex@denx.de>, herbert xu <herbert@gondor.apana.org.au>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 dillon min <dillon.minfei@gmail.com>, Alessandro
 Zummo <a.zummo@towertech.it>, netdev@vger.kernel.org,
 yannick fertre <yannick.fertre@foss.st.com>, vinod koul <vkoul@kernel.org>,
 daniel vetter <daniel@ffwll.ch>, Richard
 Weinberger <richard@nod.at>, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] dt-bindings: treewide: Update @st.com email
 address to @foss.st.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgTWFyYwoKK0pvZSBQZXJjaGVzCgpPbiAxMC8yNy8yMSA4OjExIEFNLCBQYXRyaWNlIENIT1RB
UkQgd3JvdGU6Cj4gSGkgTWFyYwo+IAo+IE9uIDEwLzIwLzIxIDE6MzkgUE0sIE1hcmMgWnluZ2ll
ciB3cm90ZToKPj4gT24gV2VkLCAyMCBPY3QgMjAyMSAwODo0NTowMiArMDEwMCwKPj4gS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPiB3cm90ZToK
Pj4+Cj4+PiBPbiAyMC8xMC8yMDIxIDA4OjUwLCBwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20g
d3JvdGU6Cj4+Pj4gRnJvbTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5z
dC5jb20+Cj4+Pj4KPj4+PiBOb3QgYWxsIEBzdC5jb20gZW1haWwgYWRkcmVzcyBhcmUgY29uY2Vy
bmVkLCBvbmx5IHBlb3BsZSB3aG8gaGF2ZQo+Pj4+IGEgc3BlY2lmaWMgQGZvc3Muc3QuY29tIGVt
YWlsIHdpbGwgc2VlIHRoZWlyIGVudHJ5IHVwZGF0ZWQuCj4+Pj4gRm9yIHNvbWUgcGVvcGxlLCB3
aG8gbGVmdCB0aGUgY29tcGFueSwgcmVtb3ZlIHRoZWlyIGVtYWlsLgo+Pj4+Cj4+Pgo+Pj4gUGxl
YXNlIHNwbGl0IHNpbXBsZSBhZGRyZXNzIGNoYW5nZSBmcm9tIG1haW50YWluZXIgdXBkYXRlcyAo
cmVtb3ZhbCwKPj4+IGFkZGl0aW9uKS4KPj4+Cj4+PiBBbHNvIHdvdWxkIGJlIG5pY2UgdG8gc2Vl
IGhlcmUgZXhwbGFpbmVkICp3aHkqIGFyZSB5b3UgZG9pbmcgdGhpcy4KPj4KPj4gQW5kIHdoeSB0
aGlzIGNhbid0IGJlIGRvbmUgd2l0aCBhIHNpbmdsZSB1cGRhdGUgdG8gLm1haWxtYXAsIGxpa2UK
Pj4gYW55b25lIGVsc2UgZG9lcy4KPiAKPiBUaGFua3MgZm9yIHRoZSB0aXBzLCB5ZXMsIGl0IHdp
bGwgYmUgc2ltcGxlci4KPiAKPiBUaGFua3MKPiBQYXRyaWNlCj4gCj4+Cj4+IAlNLgo+PgoKSSBt
YWRlIGEgdHJ5IGJ5IHVwZGF0aW5nIC5tYWlsbWFwIHdpdGggYWRkaW5nIGEgbmV3IGVudHJ5IHdp
dGggbXkgQGZvc3Muc3QuY29tIGVtYWlsIDoKCiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3Jn
PiA8cGFsaS5yb2hhckBnbWFpbC5jb20+CiBQYW9sbyAnQmxhaXNvcmJsYWRlJyBHaWFycnVzc28g
PGJsYWlzb3JibGFkZUB5YWhvby5pdD4KK1BhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJk
QGZvc3Muc3QuY29tPiA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4KIFBhdHJpY2sgTW9jaGVsIDxt
b2NoZWxAZGlnaXRhbGltcGxhbnQub3JnPgogUGF1bCBCdXJ0b24gPHBhdWxidXJ0b25Aa2VybmVs
Lm9yZz4gPHBhdWwuYnVydG9uQGltZ3RlYy5jb20+CgpCdXQgd2hlbiBydW5uaW5nIC4vc2NyaXB0
cy9nZXRfbWFpbnRhaW5lci5wbCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L3N0aS55YW1sLCBieSBvbGQgZW1haWwgaXMgc3RpbGwgZGlzcGxheWVkCgpSb2IgSGVycmluZyA8
cm9iaCtkdEBrZXJuZWwub3JnPiAobWFpbnRhaW5lcjpPUEVOIEZJUk1XQVJFIEFORCBGTEFUVEVO
RUQgREVWSUNFIFRSRUUgQklORElOR1MpClBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJk
QHN0LmNvbT4gKGluIGZpbGUpCmRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnIChvcGVuIGxpc3Q6
T1BFTiBGSVJNV0FSRSBBTkQgRkxBVFRFTkVEIERFVklDRSBUUkVFIEJJTkRJTkdTKQpsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnIChvcGVuIGxpc3QpCgpCeSBkZWZhdWx0LCB0aGUgZ2V0X21h
aW50YWluZXIucGwgc2NyaXB0IGlzIHVzaW5nIC5tYWlsbWFwIGZpbGUgKCRlbWFpbF91c2VfbWFp
bG1hcCA9IDEpLgoKSXQgc2VlbXMgdGhlcmUgaXMgYW4gaXNzdWUgd2l0aCBnZXRfbWFpbnRhaW5l
ci5wbCBhbmQgbWFpbnRhaW5lciBuYW1lL2UtbWFpbCBmb3VuZCBpbiB5YW1sIGZpbGUgPwoKVGhh
bmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
