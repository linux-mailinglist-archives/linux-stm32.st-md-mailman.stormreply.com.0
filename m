Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 732FF6B3A39
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Mar 2023 10:21:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A3E8C6A60D;
	Fri, 10 Mar 2023 09:21:37 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10395C640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 09:21:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <lgo@pengutronix.de>)
 id 1paYwN-0002lF-P7; Fri, 10 Mar 2023 10:21:31 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1paYwM-0038yl-36; Fri, 10 Mar 2023 10:21:30 +0100
Received: from lgo by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1paYwL-004Dqb-De; Fri, 10 Mar 2023 10:21:29 +0100
From: =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 10 Mar 2023 10:20:53 +0100
Message-Id: <20230310092053.1006459-2-l.goehrs@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230310092053.1006459-1-l.goehrs@pengutronix.de>
References: <20230310092053.1006459-1-l.goehrs@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: lgo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel@pengutronix.de,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 2/2] spi: stm32: split large transfers
	based on word size instead of bytes
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

VGhlIFRTSVpFIHJlZ2lzdGVyIGluIENSMiwgdG8gd2hpY2ggdGhlIG51bWJlciBvZiB3b3JkcyB0
byB0cmFuc2ZlcgppcyB3cml0dGVuLCBpcyBvbmx5IDE2IEJpdC4gVGhpcyBsaW1pdHMgdHJhbnNm
ZXJzIHRvIDY1NTM1IFNQSQpfd29yZHNfIGF0IGEgdGltZS4gVGhlIGV4aXN0aW5nIGNvZGUgdXNl
cyBzcGlfc3BsaXRfdHJhbnNmZXJzX21heHNpemUKdG8gbGltaXQgdHJhbnNmZXJzIHRvIDY1NTM1
IF9ieXRlc18gYXQgYSB0aW1lLgoKVGhpcyBicmVha3MgbGFyZ2UgdHJhbnNmZXJzIHdpdGggYml0
c19wZXJfd29yZCA+IDgsIGFzIHRoZXkgYXJlCnNwbGl0IGluc2lkZSBvZiBhIHdvcmQgYm91bmRh
cnkgYnkgdGhlIG9kZCBzaXplIGxpbWl0LgoKU3BsaXQgdHJhbnNmZXJzIGJhc2VkIG9uIHRoZSBu
dW1iZXIgb2Ygd29yZHMgaW5zdGVhZC4KVGhpcyBoYXMgdGhlIGFkZGVkIGJlbmVmaXQgb2Ygbm90
IGFydGlmaWNpYWxseSBsaW1pdGluZyB0aGUgbWF4aW11bQpsZW5ndGggb2YgYnB3ID4gOCB0cmFu
c2ZlcnMgdG8gaGFsZiBvciBhIHF1YXJ0ZXIgb2YgdGhlIGFjdHVhbCBsaW1pdC4KClRoZSBjb21i
aW5hdGlvbiBvZiB2ZXJ5IGxhcmdlIHRyYW5zZmVycyBhbmQgYml0c19wZXJfd29yZCA9IDE2IGlz
IHRyaWdnZXJlZAplLmcuIGJ5IE1JUEkgREJJIGRpc3BsYXlzIHdoZW4gdXBkYXRpbmcgbGFyZ2Ug
cGFydHMgb2YgdGhlIHNjcmVlbi4KClNpZ25lZC1vZmYtYnk6IExlb25hcmQgR8O2aHJzIDxsLmdv
ZWhyc0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL3NwaS9zcGktc3RtMzIuYyB8IDYgKysr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jIGIvZHJpdmVycy9zcGkvc3BpLXN0bTMy
LmMKaW5kZXggZGVmMDljZjBkYzE0Li5kMmUxNmYxNmZhZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
c3BpL3NwaS1zdG0zMi5jCisrKyBiL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jCkBAIC05ODQsOSAr
OTg0LDkgQEAgc3RhdGljIGludCBzdG0zMl9zcGlfcHJlcGFyZV9tc2coc3RydWN0IHNwaV9tYXN0
ZXIgKm1hc3RlciwKIAlpZiAoc3BpLT5jZmctPnNldF9udW1iZXJfb2ZfZGF0YSkgewogCQlpbnQg
cmV0OwogCi0JCXJldCA9IHNwaV9zcGxpdF90cmFuc2ZlcnNfbWF4c2l6ZShtYXN0ZXIsIG1zZywK
LQkJCQkJCSAgU1RNMzJIN19TUElfVFNJWkVfTUFYLAotCQkJCQkJICBHRlBfS0VSTkVMIHwgR0ZQ
X0RNQSk7CisJCXJldCA9IHNwaV9zcGxpdF90cmFuc2ZlcnNfbWF4d29yZHMobWFzdGVyLCBtc2cs
CisJCQkJCQkgICBTVE0zMkg3X1NQSV9UU0laRV9NQVgsCisJCQkJCQkgICBHRlBfS0VSTkVMIHwg
R0ZQX0RNQSk7CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwogCX0KLS0gCjIuMzAuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
