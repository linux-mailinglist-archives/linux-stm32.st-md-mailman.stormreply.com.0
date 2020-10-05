Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D99F28410E
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Oct 2020 22:35:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65973C424B7;
	Mon,  5 Oct 2020 20:35:56 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 973C9C424B3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 20:35:52 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mf0uq-1krT710Xnu-00gc2C; Mon, 05 Oct 2020 22:35:49 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kPXD0-0004Vs-2D; Mon, 05 Oct 2020 22:35:47 +0200
Received: (nullmailer pid 10299 invoked by uid 2001);
 Mon, 05 Oct 2020 20:35:35 -0000
From: Alexander Dahl <post@lespocky.de>
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Mon,  5 Oct 2020 22:34:40 +0200
Message-Id: <20201005203451.9985-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 60b617cbd4bf9c2e08b69b262f748e48
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:F6CgTqFAM3Qqi3ZE0tnTBE4mNujqwFryfVD6rzRWENkVcmWDhRr
 ou4O8IwayvYCgYv1NB2QHjUyKASNO7CpeAclu6bjzPbL58Yz1gjVaTbdDBLPyxkddbNmtuS
 u/zezbz5ZKHIwKkOlUPALYQ/zqHv8QRZ0g1AFFM4I9nHeiA/U1S+TTqF/YMxJ9jyNM1FNbS
 lbO7btq+DmlmbcWrsSohA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dEdS/I+Xl2I=:PiLtBsHPvNdnKu/d/mxmsJ
 rEdBMUdvRuwWDDKxyaDMAHPYxYM88Oedh0ZKhZCTBisht7o/bSAwwCmh5yLjH++jYj4GKdY7h
 iKf9faeQjYQ8Ul4FLjZDsbZIstFJNoq8pwE7EckpgkTRHOVrrokkfm5tODmAzdlLvH34+xPJh
 mXYvgsGtDDL2pCp03/03mON0DCWPhB8XG0B2w+LcGABS23CL035nuH2fHjD/Xe4YfBvLBaaGV
 OsUZlv6HNVFtuUgrjhxmj4iwkoPovo/J3QCJ3651JqQUcbDtx6V1urdeVT7QyFvQ0IZsF+z54
 /zUMHwh75CMpvTC9OWDjTLDWGYoXwCg6i4tsD4YZ6yTIRXSea9xId5KCg6Gs06SXX63UrrTbO
 AZpMIvSUeqlk3KM1a9fxNa9vr2cV9HKYu/G584ctHMX803O3BHZL5qe7267p8pKo2HTpfnOpv
 AvSbJMMgZ9LWEiTRg6XCaBS5pvXx6EwASb20FVKHtAX1sNf9dko+psaZplMFMh2r25Nn1LAQx
 CuWxdse3MucWTkS3+d4Uws/qJ7L2thzCqLDJ/EjVWtA3LuLBLhXxAoTE2B7L3Vx929KdAv7AJ
 lDtKP1Um9mgL0Jehee0bzE3MedQbE4oRQ3Fgg3bgbIyxVnvgm21DKOcXWFmkqqGTwsrvJuc1r
 ZfGlonYTZeJIeu3YQqUy4gapBGXY0N24kLYZmeD/ygjyKgSyusCoz8l/Ymf3n85CCdzO0N4Ga
 B3dHGs6BYAKGvKUYWYRaGPLF+l9pHvmSMgRx1RKA8i0KLNenqDT+W+t9hlBIW86kFKkRDIcKp
 7r7xrzNZi6L+vlKt/FWCmHM/PrxbfGJw1EMyW0qrs8fB7ujLAO/XY0VmcS9HjeU1LiAtIqw
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Denis Osterland-Heim <denis.osterland@diehl.com>,
 Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7 01/12] leds: pwm: Remove platform_data
	support
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

U2luY2UgY29tbWl0IDE0MWYxNWM2NmQ5NCAoImxlZHM6IHB3bTogcmVtb3ZlIGhlYWRlciIpIHRo
YXQgcGxhdGZvcm0KaW50ZXJmYWNlIGlzIG5vdCB1c2FibGUgZnJvbSBvdXRzaWRlIGFuZCB0aGVy
ZSBzZWVtcyB0byBiZSBubyBpbiB0cmVlCnVzZXIgYW55bW9yZS4gIEFsbCBpbi10cmVlIHVzZXJz
IG9mIHRoZSBsZWRzLXB3bSBkcml2ZXIgc2VlbSB0byB1c2UgRFQKY3VycmVudGx5LiAgR2V0dGlu
ZyByaWQgb2YgdGhlIG9sZCBwbGF0Zm9ybSBpbnRlcmZhY2UgYWxsb3dzIHRoZQpsZWRzLXB3bSBk
cml2ZXIgdG8gc3dpdGNoIG92ZXIgZnJvbSAnZGV2bV9sZWRfY2xhc3NkZXZfcmVnaXN0ZXIoKScg
dG8KJ2Rldm1fbGVkX2NsYXNzZGV2X3JlZ2lzdGVyX2V4dCgpJy4KClNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBEYWhsIDxwb3N0QGxlc3BvY2t5LmRlPgpDYzogRGVuaXMgT3N0ZXJsYW5kLUhlaW0g
PGRlbmlzLm9zdGVybGFuZEBkaWVobC5jb20+ClJldmlld2VkLWJ5OiBNYXJlayBCZWjDum4gPG1h
cmVrLmJlaHVuQG5pYy5jej4KLS0tCgpOb3RlczoKICAgIHY2IC0+IHY3OgogICAgICAqIChubyBj
aGFuZ2VzIG9uIHRoaXMgcGF0Y2gpCiAgICAKICAgIHY1IC0+IHY2OgogICAgICAqIGFkZGVkIFJl
dmlld2VkLWJ5IGZyb20gTWFyZWsKICAgICAgKiBtaW5pbWFsIGNvbW1pdCBtZXNzYWdlIHJld29y
ZGluZywgYmVjYXVzZSBhIGxhdGVyIHBhdGNoIHdhcwogICAgICAgIGFscmVhZHkgYXBwbGllZAog
ICAgCiAgICB2NToKICAgICAgKiBhZGRlZCB0aGlzIHBhdGNoIHRvIHNlcmllcyAocmVwbGFjaW5n
IGFub3RoZXIgcGF0Y2ggd2l0aCBhIG5vdAogICAgICAgIHdvcmtpbmcsIGRpZmZlcmVudCBhcHBy
b2FjaCkKCiBkcml2ZXJzL2xlZHMvbGVkcy1wd20uYyB8IDMwICsrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9sZWRzL2xlZHMtcHdtLmMgYi9kcml2ZXJzL2xlZHMv
bGVkcy1wd20uYwppbmRleCAyYTE2YWUwYmYwMjIuLmY1M2Y5MzA5Y2E2YyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9sZWRzL2xlZHMtcHdtLmMKKysrIGIvZHJpdmVycy9sZWRzL2xlZHMtcHdtLmMKQEAg
LTI0LDExICsyNCw2IEBAIHN0cnVjdCBsZWRfcHdtIHsKIAl1bnNpZ25lZCBpbnQJbWF4X2JyaWdo
dG5lc3M7CiB9OwogCi1zdHJ1Y3QgbGVkX3B3bV9wbGF0Zm9ybV9kYXRhIHsKLQlpbnQJCW51bV9s
ZWRzOwotCXN0cnVjdCBsZWRfcHdtCSpsZWRzOwotfTsKLQogc3RydWN0IGxlZF9wd21fZGF0YSB7
CiAJc3RydWN0IGxlZF9jbGFzc2RldgljZGV2OwogCXN0cnVjdCBwd21fZGV2aWNlCSpwd207CkBA
IC02MCw2ICs1NSw3IEBAIHN0YXRpYyBpbnQgbGVkX3B3bV9zZXQoc3RydWN0IGxlZF9jbGFzc2Rl
diAqbGVkX2NkZXYsCiAJcmV0dXJuIHB3bV9hcHBseV9zdGF0ZShsZWRfZGF0LT5wd20sICZsZWRf
ZGF0LT5wd21zdGF0ZSk7CiB9CiAKK19fYXR0cmlidXRlX18oKG5vbm51bGwpKQogc3RhdGljIGlu
dCBsZWRfcHdtX2FkZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBsZWRfcHdtX3ByaXYgKnBy
aXYsCiAJCSAgICAgICBzdHJ1Y3QgbGVkX3B3bSAqbGVkLCBzdHJ1Y3QgZndub2RlX2hhbmRsZSAq
Zndub2RlKQogewpAQCAtNzMsMTAgKzY5LDcgQEAgc3RhdGljIGludCBsZWRfcHdtX2FkZChzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBsZWRfcHdtX3ByaXYgKnByaXYsCiAJbGVkX2RhdGEtPmNk
ZXYubWF4X2JyaWdodG5lc3MgPSBsZWQtPm1heF9icmlnaHRuZXNzOwogCWxlZF9kYXRhLT5jZGV2
LmZsYWdzID0gTEVEX0NPUkVfU1VTUEVORFJFU1VNRTsKIAotCWlmIChmd25vZGUpCi0JCWxlZF9k
YXRhLT5wd20gPSBkZXZtX2Z3bm9kZV9wd21fZ2V0KGRldiwgZndub2RlLCBOVUxMKTsKLQllbHNl
Ci0JCWxlZF9kYXRhLT5wd20gPSBkZXZtX3B3bV9nZXQoZGV2LCBsZWQtPm5hbWUpOworCWxlZF9k
YXRhLT5wd20gPSBkZXZtX2Z3bm9kZV9wd21fZ2V0KGRldiwgZndub2RlLCBOVUxMKTsKIAlpZiAo
SVNfRVJSKGxlZF9kYXRhLT5wd20pKQogCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9F
UlIobGVkX2RhdGEtPnB3bSksCiAJCQkJICAgICAidW5hYmxlIHRvIHJlcXVlc3QgUFdNIGZvciAl
c1xuIiwKQEAgLTEzOSwxNSArMTMyLDExIEBAIHN0YXRpYyBpbnQgbGVkX3B3bV9jcmVhdGVfZndu
b2RlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGxlZF9wd21fcHJpdiAqcHJpdikKIAogc3Rh
dGljIGludCBsZWRfcHdtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7Ci0J
c3RydWN0IGxlZF9wd21fcGxhdGZvcm1fZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKCZw
ZGV2LT5kZXYpOwogCXN0cnVjdCBsZWRfcHdtX3ByaXYgKnByaXY7Ci0JaW50IGNvdW50LCBpOwog
CWludCByZXQgPSAwOworCWludCBjb3VudDsKIAotCWlmIChwZGF0YSkKLQkJY291bnQgPSBwZGF0
YS0+bnVtX2xlZHM7Ci0JZWxzZQotCQljb3VudCA9IGRldmljZV9nZXRfY2hpbGRfbm9kZV9jb3Vu
dCgmcGRldi0+ZGV2KTsKKwljb3VudCA9IGRldmljZV9nZXRfY2hpbGRfbm9kZV9jb3VudCgmcGRl
di0+ZGV2KTsKIAogCWlmICghY291bnQpCiAJCXJldHVybiAtRUlOVkFMOwpAQCAtMTU3LDE2ICsx
NDYsNyBAQCBzdGF0aWMgaW50IGxlZF9wd21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAlpZiAoIXByaXYpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JaWYgKHBkYXRhKSB7Ci0J
CWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7Ci0JCQlyZXQgPSBsZWRfcHdtX2FkZCgmcGRl
di0+ZGV2LCBwcml2LCAmcGRhdGEtPmxlZHNbaV0sCi0JCQkJCSAgTlVMTCk7Ci0JCQlpZiAocmV0
KQotCQkJCWJyZWFrOwotCQl9Ci0JfSBlbHNlIHsKLQkJcmV0ID0gbGVkX3B3bV9jcmVhdGVfZndu
b2RlKCZwZGV2LT5kZXYsIHByaXYpOwotCX0KKwlyZXQgPSBsZWRfcHdtX2NyZWF0ZV9md25vZGUo
JnBkZXYtPmRldiwgcHJpdik7CiAKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
