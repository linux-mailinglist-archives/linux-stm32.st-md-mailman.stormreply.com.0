Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADCAAC7AAE
	for <lists+linux-stm32@lfdr.de>; Thu, 29 May 2025 11:07:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 303F6C349C6;
	Thu, 29 May 2025 09:07:35 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6454BC349C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 May 2025 09:07:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D39D3432F7;
 Thu, 29 May 2025 09:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748509652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mPkPFeJr+GG2QcllwMOxn9k+r0jQZG2uRhor86+okS8=;
 b=GjSyVNNhLuWD0eGfSgz+3Na5WuC2OLzLh+5UnSJNzmVrch94OoeOIFQsbUUciQ5mVMulgU
 +QFiWpUrs3eTBRdCWjtrqiIWAj36uYmsahEcEjnm8tOxk/lEiniaH/9BTj1vf5is09GDXs
 QPbSLpgKtUIPgHaUY8tGCqdYrdu4eLsPs7hI6I/dU8hb065JCHL5il/ka5TewcMuDSQZq6
 6IRdyaD40n/GlpN7kwPFjaCuPnEDyVd2PPjEwaSf0GTe3aHp05g1uua356TOMb1nwSn53v
 /7x3obzzl3JCMiCjQRlmex//ESAt1MC5dqgiGZaIkGiEfRUE0TZPmFZNt9izoA==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Thu, 29 May 2025 11:07:22 +0200
Message-Id: <20250529-stmmac_tstamp_div-v4-0-d73340a794d5@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMojOGgC/23N0QqCMBTG8VeJXbfYzjxqXfUeEbLNmYN04sYox
 HdvCoGRl/8Pzu9MxJvRGk8uh4mMJlpvXZ8iOx6IbmX/MNTWqQkwQIYA1Ieuk7oKPshuqGobaYP
 IOTQsZ3Am6W4YTWNfq3m7p26tD258ry8iX9avJna0yCmnSstSohQyK4qrci48bX/SriOLF2FrF
 HsGJCPPBSBXQmEG/4bYGuWeISijCgGNrpu6zPSvMc/zB2EIctk8AQAA
X-Change-ID: 20250522-stmmac_tstamp_div-f55112f06029
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Phil Reid <preid@electromag.com.au>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvheejfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffefvdelledtfeekudelvdekvdeuffduieevkedviedtgeefueehgfdvuedthfeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgduledvrdduieekrddurddvtdekngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtoheprhhitghhrghruggtohgthhhrrghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomhdprhgtphhtthhopehmrgigihhmvgdrt
 ghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeflohhsvgdrtegsrhgvuhesshihnhhophhshihsrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehjohgrsghrvghusehshihnohhpshihshdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
 Yanteng Si <si.yanteng@linux.dev>, linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/2] net: stmmac: prevent div by 0
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

SGVsbG8sCnRoaXMgc21hbGwgc2VyaWVzIGFpbXMgdG8gZml4IGEgc21hbGwgc3BsYXQgSSBhbSBv
YnNlcnZpbmcgb24gYSBTVE0zMk1QMTU3CnBsYXRmb3JtIGF0IGJvb3QgKHNlZSBjb21taXQgMSkg
ZHVlIHRvIGEgZGl2aXNpb24gYnkgMC4KVGhlcmUgaXMgbm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW4g
dGhpcyByZXZpc2lvbiwgdGhpcyBoYXMganVzdCBiZWVuCnJlYmFzZWQgb24gdG9wIG9mIG5ldC9t
YWluLgoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290
bGluLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjQ6Ci0gY29sbGVjdCBSQiB0YWdzCi0gcmViYXNlZCBv
biBuZXQvbWFpbgotIExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA1
Mjgtc3RtbWFjX3RzdGFtcF9kaXYtdjMtMC1iNTI1ZWNkZmQ4NGNAYm9vdGxpbi5jb20KCkNoYW5n
ZXMgaW4gdjM6Ci0gcmVtb3ZlIG5vdyBkdXBsaWNhdGUgY2hlY2sKLSBhZGQgcHRwX3JhdGUgY2hl
Y2sgaW4gZXN0X2NvbmZpZ3VyZQotIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNTA1Mjctc3RtbWFjX3RzdGFtcF9kaXYtdjItMS02NjMyNTFiM2I1NDJAYm9vdGxpbi5j
b20KCkNoYW5nZXMgaW4gdjI6Ci0gQWRkIEZpeGVzIHRhZwotIFJld29yZCBjb21taXQgbWVzc2Fn
ZSB0byBjbGFyaWZ5IHRoZSB0cmlnZ2VyaW5nIGNhdXNlIG9mIHRoZSBpc3N1ZQotIExpbmsgdG8g
djE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA1MjMtc3RtbWFjX3RzdGFtcF9kaXYt
djEtMS1iY2E4YTVhM2E0NzdAYm9vdGxpbi5jb20KCi0tLQpBbGV4aXMgTG90aG9yw6kgKDIpOgog
ICAgICBuZXQ6IHN0bW1hYzogbWFrZSBzdXJlIHRoYXQgcHRwX3JhdGUgaXMgbm90IDAgYmVmb3Jl
IGNvbmZpZ3VyaW5nIHRpbWVzdGFtcGluZwogICAgICBuZXQ6IHN0bW1hYzogbWFrZSBzdXJlIHRo
YXQgcHRwX3JhdGUgaXMgbm90IDAgYmVmb3JlIGNvbmZpZ3VyaW5nIEVTVAoKIGRyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19lc3QuYyAgfCA1ICsrKysrCiBkcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jIHwgNSArKysrKwogZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3B0cC5jICB8IDIgKy0KIDMg
ZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotLS0KYmFzZS1j
b21taXQ6IDI3MTY4M2JiMmNmMzJlNTEyNmM1OTJiNWQ1ZTZhNzU2ZmEzNzRmZDkKY2hhbmdlLWlk
OiAyMDI1MDUyMi1zdG1tYWNfdHN0YW1wX2Rpdi1mNTUxMTJmMDYwMjkKCkJlc3QgcmVnYXJkcywK
LS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
