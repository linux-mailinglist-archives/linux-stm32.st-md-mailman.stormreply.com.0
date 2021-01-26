Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42636304448
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jan 2021 18:01:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1A19C57181;
	Tue, 26 Jan 2021 17:01:16 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1FFBC3FAD8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jan 2021 17:01:15 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l4RgD-00045p-EA; Tue, 26 Jan 2021 17:59:01 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l4Rg3-0003hY-Ft; Tue, 26 Jan 2021 17:58:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Russell King <linux@armlinux.org.uk>, Matt Mackall <mpm@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Date: Tue, 26 Jan 2021 17:58:30 +0100
Message-Id: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig.org@pengutronix.de>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org, kernel@pengutronix.de,
 Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 0/5] amba: minor fix and various cleanups
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

RnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZy5vcmdAcGVuZ3V0cm9uaXgu
ZGUKCkhlbGxvLAoKQ2hhbmdlcyBzaW5jZSB2MiBzZW50IHdpdGggTWVzc2FnZS1JZDoKMjAyMDEx
MjQxMzMxMzkuMzA3MjEyNC0xLXV3ZUBrbGVpbmUta29lbmlnLm9yZzoKCiAtIFJlYmFzZSB0byB2
NS4xMS1yYzEgKHdoaWNoIHJlc3VsdGVkIGluIGEgZmV3IGNvbmZsaWN0cyBpbgogICBkcml2ZXJz
L2h3dHJhY2luZykuCiAtIEFkZCB2YXJpb3VzIEFja3MuCiAtIFNlbmQgdG8gbW9yZSBtYWludGFp
bmVycyBkaXJlY3RseSAod2hpY2ggSSB0aGluayBpcyBvbmUgb2YgdGhlCiAgIHJlYXNvbnMgd2h5
IHRoZXJlIGFyZSBzbyBmZXcgQWNrcykuCgpGb3IgbXkgdGFzdGUgcGF0Y2ggNCBuZWVkcyBzb21l
IG1vcmUgYWNrcyAoZHJpdmVycy9jaGFyL2h3X3JhbmRvbSwKZHJpdmVycy9kbWEsIGRyaXZlcnMv
Z3B1L2RybS9wbDExMSwgZHJpdmVycy9pMmMsIGRyaXZlcnMvbW1jLApkcml2ZXJzL3ZmaW8sIGRy
aXZlcnMvd2F0Y2hkb2cgYW5kIHNvdW5kL2FybSBoYXZlIG5vIG1haW50YWluZXIgZmVlZGJhY2sK
eWV0KS4KCk15IHN1Z2dlc3Rpb24gaXMgdG8gbGV0IHRoaXMgc2VyaWVzIGdvIGluIHZpYSBSdXNz
ZWxsIEtpbmcgKHdobyBjYXJlcwpmb3IgYW1iYSkuIE9uY2UgZW5vdWdoIEFja3MgYXJlIHRoZXJl
IEkgY2FuIGFsc28gcHJvdmlkZSBhIHRhZyBmb3IKbWVyZ2luZyBpbnRvIGRpZmZlcmVudCB0cmVl
cy4gSnVzdCB0ZWxsIG1lIGlmIHlvdSBwcmVmZXIgdGhpcyBzb2x1dGlvbi4KCldvdWxkIGJlIGdy
ZWF0IGlmIHRoaXMgY291bGQgbWFrZSBpdCBmb3IgdjUuMTIsIGJ1dCBJJ20gYXdhcmUgaXQncwph
bHJlYWR5IGxhdGUgaW4gdGhlIHY1LjExIGN5Y2xlIHNvIGl0IG1pZ2h0IGhhdmUgdG8gd2FpdCBm
b3IgdjUuMTMuCgpCZXN0IHJlZ2FyZHMKVXdlCgpVd2UgS2xlaW5lLUvDtm5pZyAoNSk6CiAgYW1i
YTogRml4IHJlc291cmNlIGxlYWsgZm9yIGRyaXZlcnMgd2l0aG91dCAucmVtb3ZlCiAgYW1iYTog
cmVvcmRlciBmdW5jdGlvbnMKICB2ZmlvOiBwbGF0Zm9ybTogc2ltcGxpZnkgZGV2aWNlIHJlbW92
YWwKICBhbWJhOiBNYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQKICBhbWJhOiBN
YWtlIHVzZSBvZiBidXNfdHlwZSBmdW5jdGlvbnMKCiBkcml2ZXJzL2FtYmEvYnVzLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAyMzQgKysrKysrKysrLS0tLS0tLS0tCiBkcml2ZXJzL2No
YXIvaHdfcmFuZG9tL25vbWFkaWstcm5nLmMgICAgICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvZG1h
L3BsMzMwLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQogZHJpdmVycy9ncHUv
ZHJtL3BsMTExL3BsMTExX2Rydi5jICAgICAgICAgICAgIHwgICA0ICstCiBkcml2ZXJzL2h3dHJh
Y2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWNhdHUuYyAgfCAgIDMgKy0KIC4uLi9od3RyYWNpbmcv
Y29yZXNpZ2h0L2NvcmVzaWdodC1jcHUtZGVidWcuYyB8ICAgNCArLQogLi4uL2h3dHJhY2luZy9j
b3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS1jb3JlLmMgIHwgICA0ICstCiBkcml2ZXJzL2h3dHJhY2lu
Zy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0YjEwLmMgfCAgIDQgKy0KIC4uLi9jb3Jlc2lnaHQvY29y
ZXNpZ2h0LWV0bTN4LWNvcmUuYyAgICAgICAgICB8ICAgNCArLQogLi4uL2NvcmVzaWdodC9jb3Jl
c2lnaHQtZXRtNHgtY29yZS5jICAgICAgICAgIHwgICA0ICstCiAuLi4vaHd0cmFjaW5nL2NvcmVz
aWdodC9jb3Jlc2lnaHQtZnVubmVsLmMgICAgfCAgIDQgKy0KIC4uLi9jb3Jlc2lnaHQvY29yZXNp
Z2h0LXJlcGxpY2F0b3IuYyAgICAgICAgICB8ICAgNCArLQogZHJpdmVycy9od3RyYWNpbmcvY29y
ZXNpZ2h0L2NvcmVzaWdodC1zdG0uYyAgIHwgICA0ICstCiAuLi4vaHd0cmFjaW5nL2NvcmVzaWdo
dC9jb3Jlc2lnaHQtdG1jLWNvcmUuYyAgfCAgIDQgKy0KIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVz
aWdodC9jb3Jlc2lnaHQtdHBpdS5jICB8ICAgNCArLQogZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1u
b21hZGlrLmMgICAgICAgICAgICAgIHwgICA0ICstCiBkcml2ZXJzL2lucHV0L3NlcmlvL2FtYmFr
bWkuYyAgICAgICAgICAgICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvbWVtb3J5L3BsMTcyLmMgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQogZHJpdmVycy9tZW1vcnkvcGwzNTMtc21jLmMg
ICAgICAgICAgICAgICAgICAgIHwgICA0ICstCiBkcml2ZXJzL21tYy9ob3N0L21tY2kuYyAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIGRyaXZlcnMvcnRjL3J0Yy1wbDAzMC5jICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNCArLQogZHJpdmVycy9ydGMvcnRjLXBsMDMxLmMgICAgICAg
ICAgICAgICAgICAgICAgIHwgICA0ICstCiBkcml2ZXJzL3NwaS9zcGktcGwwMjIuYyAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDUgKy0KIGRyaXZlcnMvdHR5L3NlcmlhbC9hbWJhLXBsMDEwLmMg
ICAgICAgICAgICAgICB8ICAgNCArLQogZHJpdmVycy90dHkvc2VyaWFsL2FtYmEtcGwwMTEuYyAg
ICAgICAgICAgICAgIHwgICAzICstCiBkcml2ZXJzL3ZmaW8vcGxhdGZvcm0vdmZpb19hbWJhLmMg
ICAgICAgICAgICAgfCAgMTUgKy0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvYW1iYS1jbGNkLmMgICAg
ICAgICAgICAgICB8ICAgNCArLQogZHJpdmVycy93YXRjaGRvZy9zcDgwNV93ZHQuYyAgICAgICAg
ICAgICAgICAgIHwgICA0ICstCiBpbmNsdWRlL2xpbnV4L2FtYmEvYnVzLmggICAgICAgICAgICAg
ICAgICAgICAgfCAgIDIgKy0KIHNvdW5kL2FybS9hYWNpLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgNCArLQogMzAgZmlsZXMgY2hhbmdlZCwgMTU3IGluc2VydGlvbnMoKyksIDE5
OCBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1pdDogNWM4ZmU1ODNjY2U1NDJhYTBiODRhZGM5Mzlj
ZTg1MjkzZGUzNmU1ZQotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
