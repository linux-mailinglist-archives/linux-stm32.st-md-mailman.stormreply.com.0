Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCD566BFEF
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jan 2023 14:38:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF966C65E6F;
	Mon, 16 Jan 2023 13:38:22 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5E6DC65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 10:37:27 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9002F1BF21D;
 Mon, 16 Jan 2023 10:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673865447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fFLwBp143kB/LSaCSwLfM/ltYrhQ/PI8Cc5ar94b9Ls=;
 b=AbClFznbfLK1tHwzNMo1ZZTKkPrE2PqxhzA5su3b03jNpwuzLu/LnE7peKBjSobhwUqkG0
 9leHb8Mf6zMwXHUR9sXmR9w3a5G944U0VQlffclPECthNy2JLnZRb5BYL9XKSpFzzShZ+N
 x0IXJEorQS0lKX5X80PtA2mdCXq7am2nU72Yna4/y/ect0DBBT7AkeeUu/pwjFDuFhM9VK
 DOp/YaUz0Te5BPx3laRY6seLPz1sX/2UY44ZbZbFBYsmPIaomWj/TnxTrS8VHV8cNh59Lm
 ZK7tDhU/p5gp20ED6TR33ff/aOBIx82bC0pntSwv8RSy7hql4umCa1IOb+xF6Q==
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>
Date: Mon, 16 Jan 2023 11:39:21 +0100
Message-Id: <20230116103926.276869-2-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116103926.276869-1-clement.leger@bootlin.com>
References: <20230116103926.276869-1-clement.leger@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Jan 2023 13:38:20 +0000
Cc: devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-renesas-soc@vger.kernel.org,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>, Jimmy Lalande <jimmy.lalande@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/6] net: stmmac: add support to use
	a generic phylink_pcs as PCS
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

Q3VycmVudGx5LCB0aGUgUENTIGlzIHNldCBiYXNlZCBvbiB0aGUgcHJlc2VuY2Ugb2YgdGhlIHhw
Y3MgZmllbGQuIEluCm9yZGVyIHRvIGFsbG93IHN1cHBvcnRpbmcgb3RoZXIgUENTLCBhZGQgYSBw
aHlsaW5rX3BjcyBwY3MgZmllbGQgdG8gc3RydWN0Cm1hY19kZXZpY2VfaW5mbyB3aGljaCBpcyB1
c2VkIGluIHN0bW1hY19tYWNfc2VsZWN0X3BjcygpIHRvIHNlbGVjdCB0aGUKY29ycmVjdCBQQ1Mu
CgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5j
b20+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvY29tbW9uLmggICAg
ICB8IDIgKysKIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWlu
LmMgfCA1ICstLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNf
bWRpby5jIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9j
b21tb24uaCBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2NvbW1vbi5oCmlu
ZGV4IDZiNWQ5NmJjZWQ0Ny4uNzlmZDY3ZThhYjkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9jb21tb24uaAorKysgYi9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9jb21tb24uaApAQCAtMTUsNiArMTUsNyBAQAogI2luY2x1ZGUgPGxp
bnV4L25ldGRldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3N0bW1hYy5oPgogI2luY2x1ZGUgPGxp
bnV4L3BoeS5oPgorI2luY2x1ZGUgPGxpbnV4L3BoeWxpbmsuaD4KICNpbmNsdWRlIDxsaW51eC9w
Y3MvcGNzLXhwY3MuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpZiBJU19FTkFCTEVE
KENPTkZJR19WTEFOXzgwMjFRKQpAQCAtNTE4LDYgKzUxOSw3IEBAIHN0cnVjdCBtYWNfZGV2aWNl
X2luZm8gewogCWNvbnN0IHN0cnVjdCBzdG1tYWNfdGNfb3BzICp0YzsKIAljb25zdCBzdHJ1Y3Qg
c3RtbWFjX21tY19vcHMgKm1tYzsKIAlzdHJ1Y3QgZHdfeHBjcyAqeHBjczsKKwlzdHJ1Y3QgcGh5
bGlua19wY3MgKnBoeWxpbmtfcGNzOwogCXN0cnVjdCBtaWlfcmVncyBtaWk7CS8qIE1JSSByZWdp
c3RlciBBZGRyZXNzZXMgKi8KIAlzdHJ1Y3QgbWFjX2xpbmsgbGluazsKIAl2b2lkIF9faW9tZW0g
KnBjc3I7ICAgICAvKiB2cG9pbnRlciB0byBkZXZpY2UgQ1NScyAqLwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKaW5kZXggYzY5NTFjOTc2
ZjVkLi4xOTQ1OWVmMTVhMzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL3N0bW1hY19tYWluLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvc3RtbWFjX21haW4uYwpAQCAtOTM3LDEwICs5MzcsNyBAQCBzdGF0aWMgc3RydWN0
IHBoeWxpbmtfcGNzICpzdG1tYWNfbWFjX3NlbGVjdF9wY3Moc3RydWN0IHBoeWxpbmtfY29uZmln
ICpjb25maWcsCiB7CiAJc3RydWN0IHN0bW1hY19wcml2ICpwcml2ID0gbmV0ZGV2X3ByaXYodG9f
bmV0X2Rldihjb25maWctPmRldikpOwogCi0JaWYgKCFwcml2LT5ody0+eHBjcykKLQkJcmV0dXJu
IE5VTEw7Ci0KLQlyZXR1cm4gJnByaXYtPmh3LT54cGNzLT5wY3M7CisJcmV0dXJuIHByaXYtPmh3
LT5waHlsaW5rX3BjczsKIH0KIAogc3RhdGljIHZvaWQgc3RtbWFjX21hY19jb25maWcoc3RydWN0
IHBoeWxpbmtfY29uZmlnICpjb25maWcsIHVuc2lnbmVkIGludCBtb2RlLApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21kaW8uYyBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tZGlvLmMKaW5kZXggNWYxNzdl
YTgwNzI1Li4zZTg3NWQ0NjY0YzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL3N0bW1hY19tZGlvLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvc3RtbWFjX21kaW8uYwpAQCAtNDEzLDYgKzQxMyw3IEBAIGludCBzdG1tYWNf
eHBjc19zZXR1cChzdHJ1Y3QgbWlpX2J1cyAqYnVzKQogCQl9CiAKIAkJcHJpdi0+aHctPnhwY3Mg
PSB4cGNzOworCQlwcml2LT5ody0+cGh5bGlua19wY3MgPSAmeHBjcy0+cGNzOwogCQlicmVhazsK
IAl9CiAKLS0gCjIuMzkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
