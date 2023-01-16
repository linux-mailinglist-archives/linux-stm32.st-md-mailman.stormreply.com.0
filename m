Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CCE66BFF0
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jan 2023 14:38:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD124C6507E;
	Mon, 16 Jan 2023 13:38:22 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEE71C6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 10:37:23 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D331A1BF20C;
 Mon, 16 Jan 2023 10:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673865443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iuogAIwpArvmHJjJhEa0zf0j5PCkZDBGtycwVIelMX8=;
 b=CEhOE2qh+5jjLZr3yM8AnWuKjQL21XfBx2BU/akJuNd5H5Qld2ukY9uV2vsZYedWeZF2Pk
 ZkBScwq/jK/2rnV+ioVHfb70cF9a0TBkD5d6UeTy5aiv7iZ7iL7aXsdomFhUXGcgFP4BPh
 uPRGALpCDZnm6f+8GD9nDQAVSRnMeULNN0K99nnVq4yPZ+qw6w6aoeHgC04jxqhi5DOQg/
 KrABaPJmOblW7Vaif6Dx3Tbg23fpguN0heuzjx32dVhL3Z5H31c/QD0BHx2njYuvD6KxxW
 zeU6IGyGL9+WhfeWlplRXaZiiGpy9iKBnuUu0jyXlm9ymsssh86wYYQbbqJnUA==
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
Date: Mon, 16 Jan 2023 11:39:20 +0100
Message-Id: <20230116103926.276869-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.39.0
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
Subject: [Linux-stm32] [PATCH net-next 0/6] net: stmmac: add renesas,
	rzn1-gmac support
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

VGhlIHJ6bjEtZ21hYyBpbnN0YW5jZSBpcyBjb25uZWN0ZWQgdG8gYSBQQ1MgKE1JSUMpLiBJbiBv
cmRlciB0byB1c2UKdGhpcyBwY3MsIGFkZCBzdXBwb3J0IGluIHRoZSBzdHRtYWMgZHJpdmVyIHRv
IHNldCBhIGdlbmVyaWMgcGh5bGluayBwY3MKZGV2aWNlIGluc3RlYWQgb2YgdGhlIHhwY3Mgb25s
eS4gTW9yZW92ZXIsIGl0IGFkZHMgc3VwcG9ydCB0byBwcm92aWRlCmEgcGh5bGluayBwY3MgZGV2
aWNlIGZyb20gdGhlIHN0bW1hYyBwbGF0Zm9ybSBkYXRhIGFuZCB1c2UgaXQgd2l0aCB0aGUKZHJp
dmVyLiBJdCBhbHNvIGFkZHMgdGhlIGJpbmRpbmdzIGFuZCB0aGUgbmV3IHJ6bjEtZ21hYyBkcml2
ZXIgdGhhdApyZXRyaWV2ZSB0aGlzIHBjcyBmcm9tIHRoZSBkZXZpY2UtdHJlZS4KCkNsw6ltZW50
IEzDqWdlciAoNik6CiAgbmV0OiBzdG1tYWM6IGFkZCBzdXBwb3J0IHRvIHVzZSBhIGdlbmVyaWMg
cGh5bGlua19wY3MgYXMgUENTCiAgbmV0OiBzdG1tYWM6IGFkZCBzdXBwb3J0IHRvIHByb3ZpZGUg
cGNzIGZyb20gcGxhdGZvcm0gZGF0YQogIG5ldDogc3RtbWFjOiBzdGFydCBwaHlsaW5rIGJlZm9y
ZSBzZXR0aW5nIHVwIGhhcmR3YXJlCiAgZHQtYmluZGluZ3M6IG5ldDogcmVuZXNhcyxyem4xLWdt
YWM6IERvY3VtZW50IFJaL04xIEdNQUMgc3VwcG9ydAogIG5ldDogc3RtbWFjOiBhZGQgc3VwcG9y
dCBmb3IgUlovTjEgR01BQwogIEFSTTogZHRzOiByOWEwNmcwMzI6IGRlc2NyaWJlIEdNQUMxCgog
Li4uL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sICAgICAgIHwgIDcxICsrKysr
KysrKysrCiBhcmNoL2FybS9ib290L2R0cy9yOWEwNmcwMzIuZHRzaSAgICAgICAgICAgICAgfCAg
MTggKysrCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmlnICAgfCAg
MTEgKysKIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL01ha2VmaWxlICB8ICAg
MSArCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9jb21tb24uaCAgfCAgIDIg
KwogLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yem4xLmMgIHwgMTEzICsr
KysrKysrKysrKysrKysrKwogLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNf
bWFpbi5jIHwgIDE1ICsrLQogLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNf
bWRpby5jIHwgICAxICsKIGluY2x1ZGUvbGludXgvc3RtbWFjLmggICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArCiA5IGZpbGVzIGNoYW5nZWQsIDIyOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9uZXQvcmVuZXNhcyxyem4xLWdtYWMueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJ6bjEuYwoKLS0gCjIuMzkuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
