Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4BA6D3863
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Apr 2023 16:31:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47406C6A5FD;
	Sun,  2 Apr 2023 14:31:19 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDA25C6A5FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Apr 2023 14:31:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjM-0002tW-Lv; Sun, 02 Apr 2023 16:30:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjD-008TQM-5v; Sun, 02 Apr 2023 16:30:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjC-009zBI-BL; Sun, 02 Apr 2023 16:30:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Date: Sun,  2 Apr 2023 16:30:14 +0200
Message-Id: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3027;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=2S8iDuofW67/ny3bI4GsEkxdI4rVopUa4vtAe1AT45s=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKZFtalM3e5vgpcp2bO9QfXXotzevy7zlzaW6S
 v6ELfAMxDeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCmRbQAKCRCPgPtYfRL+
 Th1PCACf4rIZGqr7Q1fHE0q/GWziKMJqR85AtxSGXJLhzT7CQSsyTXjBwYVABzW53zfy7pCrr4T
 HXZsWp66M/nk9P5mpeaDTcUcTPF6Qs/NTHteV/BXG4fj6e6WI8rrYF+KM04pO7+oF6oguY4imfS
 fwj5GYmyLZIFPP/iQjUjtQ9EHVBjDYDZw7rgDnX9S0aT6ntEGHpOtyknrs9kXNI832Squ9C+XCP
 s0fDZLuIuFx9EEAo3qRBbBheDH0kO3cs1Gg2Dq9MPf/PxvjH7KAtCymq/Kmlp1vFkRa+j88Wy5w
 a9Bnr4Pih92GDV2Y6wNv/CXK5iG5ZlZVUwGFiMn21RZaY50D
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-oxnas@groups.io, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net-next 00/11] net: stmmac: Convert to
	platform remove callback returning void
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

SGVsbG8sCgp0aGlzIHNlcmllcyBhZGFwdHMgdGhlIHBsYXRmb3JtIGRyaXZlcnMgYmVsb3cKZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNybyB0byB1c2UgdGhlIC5yZW1vdmVfbmV3KCkgY2FsbGJh
Y2suIENvbXBhcmVkCnRvIHRoZSB0cmFkaXRpb25hbCAucmVtb3ZlKCkgY2FsbGJhY2sgLnJlbW92
ZV9uZXcoKSByZXR1cm5zIG5vIHZhbHVlLgpUaGlzIGlzIGEgZ29vZCB0aGluZyBiZWNhdXNlIHRo
ZSBkcml2ZXIgY29yZSBkb2Vzbid0IChhbmQgY2Fubm90KSBjb3BlCmZvciBlcnJvcnMgZHVyaW5n
IHJlbW92ZS4gVGhlIG9ubHkgZWZmZWN0IG9mIGEgbm9uLXplcm8gcmV0dXJuIHZhbHVlIGluCi5y
ZW1vdmUoKSBpcyB0aGF0IHRoZSBkcml2ZXIgY29yZSBlbWl0cyBhIHdhcm5pbmcuIFRoZSBkZXZp
Y2UgaXMgcmVtb3ZlZAphbnlob3cgYW5kIGFuIGVhcmx5IHJldHVybiBmcm9tIC5yZW1vdmUoKSB1
c3VhbGx5IHlpZWxkcyBhIHJlc291cmNlCmxlYWsuCgpUaGUgZmlyc3QgdGhyZWUgY29tbWl0cyBt
YWtlIHN1cmUgdGhhdCB0aGUgdmFyaW91cyByZW1vdmUgY2FsbGJhY2tzCihvYnZpb3VzbHkpIGFs
d2F5cyByZXR1cm4gemVyby4gQWZ0ZXIgdGhhdCBhbGwgZHJpdmVycyBhcmUgY29udmVydGVkIHRv
Ci5yZW1vdmVfbmV3KCkuCgpVd2UgS2xlaW5lLUvDtm5pZyAoMTEpOgogIG5ldDogc3RtbWFjOiBN
YWtlIHN0bW1hY19wbHRmcl9yZW1vdmUoKSByZXR1cm4gdm9pZAogIG5ldDogc3RtbWFjOiBkd21h
Yy12aXNjb250aTogTWFrZSB2aXNjb250aV9ldGhfY2xvY2tfcmVtb3ZlKCkgcmV0dXJuIHZvaWQK
ICBuZXQ6IHN0bW1hYzogZHdtYWMtcWNvbS1ldGhxb3M6IERyb3AgYW4gaWYgd2l0aCBhbiBhbHdh
eXMgZmFsc2UgY29uZGl0aW9uCiAgbmV0OiBzdG1tYWM6IGR3bWFjLXZpc2NvbnRpOiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIG5ldDogc3RtbWFj
OiBkd21hYy1kd2MtcW9zLWV0aDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sg
cmV0dXJuaW5nIHZvaWQKICBuZXQ6IHN0bW1hYzogZHdtYWMtcWNvbS1ldGhxb3M6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgbmV0OiBzdG1tYWM6
IGR3bWFjLXJrOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZAogIG5ldDogc3RtbWFjOiBkd21hYy1zdGk6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgbmV0OiBzdG1tYWM6IGR3bWFjLXN0bTMyOiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIG5ldDogc3Rt
bWFjOiBkd21hYy1zdW44aTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0
dXJuaW5nIHZvaWQKICBuZXQ6IHN0bW1hYzogZHdtYWMtdGVncmE6IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCgogLi4uL2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLWFuYXJpb24uYyAgIHwgIDIgKy0KIC4uLi9zdG1pY3JvL3N0bW1hYy9kd21h
Yy1kd2MtcW9zLWV0aC5jICAgICAgICB8ICA2ICsrLS0tLQogLi4uL2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLWdlbmVyaWMuYyAgIHwgIDIgKy0KIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvZHdtYWMtaW14LmMgICB8ICAyICstCiAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvZHdtYWMtaW5nZW5pYy5jICAgfCAgMiArLQogLi4uL3N0bWljcm8vc3RtbWFjL2R3bWFjLWlu
dGVsLXBsYXQuYyAgICAgICAgIHwgIDkgKysrLS0tLS0tCiAuLi4vZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtaXBxODA2eC5jICAgfCAgMiArLQogLi4uL2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjLWxwYzE4eHguYyAgIHwgIDIgKy0KIC4uLi9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9kd21hYy1tZWRpYXRlay5jICB8ICA5ICsrKy0tLS0tLQogLi4uL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1tZXNvbi5jIHwgIDIgKy0KIC4uLi9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1tZXNvbjhiLmMgICB8ICAyICstCiAuLi4vbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLW94bmFzLmMgfCAgMiArLQogLi4uL3N0bWljcm8vc3RtbWFjL2R3bWFjLXFj
b20tZXRocW9zLmMgICAgICAgIHwgMTUgKysrKy0tLS0tLS0tLS0tCiAuLi4vbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMgICAgfCAgNiArKy0tLS0KIC4uLi9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1zb2NmcGdhLmMgICB8ICAyICstCiAuLi4vbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0aS5jICAgfCAgNiArKy0tLS0KIC4uLi9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RtMzIuYyB8ICA2ICsrLS0tLQogLi4uL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdW44aS5jIHwgIDYgKystLS0tCiAuLi4vbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN1bnhpLmMgfCAgMiArLQogLi4uL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy10ZWdyYS5jIHwgIDYgKystLS0tCiAuLi4vZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtdmlzY29udGkuYyAgfCAxOSArKysrKy0tLS0tLS0tLS0t
LS0tCiAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BsYXRmb3JtLmMgfCAgNCAr
LS0tCiAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BsYXRmb3JtLmggfCAgMiAr
LQogMjMgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgNzYgZGVsZXRpb25zKC0pCgpi
YXNlLWNvbW1pdDogZmUxNWMyNmVlMjZlZmExMTc0MWE3YjYzMmU5ZjIzYjAxYWNhNGNjNgotLSAK
Mi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
