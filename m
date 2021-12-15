Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC01E47636B
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Dec 2021 21:37:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76DC8C5E2C5;
	Wed, 15 Dec 2021 20:37:32 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2404BC0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 20:37:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mxb1g-0006jz-Ni; Wed, 15 Dec 2021 21:37:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1mxb1c-004jAa-LL; Wed, 15 Dec 2021 21:37:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mxb1a-0001Pd-QY; Wed, 15 Dec 2021 21:37:18 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 15 Dec 2021 21:37:08 +0100
Message-Id: <20211215203709.52916-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215203709.52916-1-u.kleine-koenig@pengutronix.de>
References: <20211215203709.52916-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=Ua29ErnMvWtG1PwQBhezjCBc0JdZIdojjLdmzLrVbUI=;
 m=+CoshTMQi81nxraUkr7hDTo2psUjT5b4zYhDqufPh1I=;
 p=/mxG1k3fCbRerhEOYpdM+MZtKGQJLNPg2ukDm32ylDw=;
 g=5d77fa5d4d1d7e5b7e26ff01a2a2e38084109227
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmG6Ue0ACgkQwfwUeK3K7An+iAf+Nri
 OkQrY9qL3ThwzwmDwXCTZ/3wWz8PoXbtB/6wU9flfA4lrfmXn03GtFEb4Hkow0gkwp/U0CDcDBvbQ
 6NSGp969P2x1br+iyvotVUCSnk6zJLv0TNThtlF+Vj7f7uTNAztJmkFZt76mjVY6+xzaCSkhFlMg+
 rxgCE7swC3xdTV5NO5orTiOkAbHb+lNn4V1LuGmiJ/n2njRj7YERpuj7uY29UspDA+MhwY9IrnQ5N
 MW1xNcCH8ZONZ2Y775lkFGYS3RB741lR7OgE0pgXXPvl7Fmam3St9DPkRiIpcgdisWHczCnaea2xp
 Qs/yZitwZCEZURmsQLwBytInQeD+IQA==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/2] dt-bindings: mfd: stm32-timers:
	Document how to specify interrupts
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

VGhlIHRpbWVyIHVuaXRzIGluIHRoZSBzdG0zMm1wMSBDUFVzIGhhdmUgaW50ZXJydXB0cywgZGVw
ZW5kaW5nIG9uIHRoZQp0aW1lciBmbGF2b3VyIGVpdGhlciBvbmUgImdsb2JhbCIgb3IgZm91ciBk
ZWRpY2F0ZWQgb25lcy4gRG9jdW1lbnQgaG93CnRvIGZvcm1hbGl6ZSB0aGVzZSBpbiBhIGRldmlj
ZSB0cmVlLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3Rt
MzItdGltZXJzLnlhbWwgICAgfCAxMyArKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZmQvc3Qsc3RtMzItdGltZXJzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWZkL3N0LHN0bTMyLXRpbWVycy55YW1sCmluZGV4IDEwYjMzMGQ0MjkwMS4uNWU0
MjE0ZDE2MTNiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWZkL3N0LHN0bTMyLXRpbWVycy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZmQvc3Qsc3RtMzItdGltZXJzLnlhbWwKQEAgLTQ2LDYgKzQ2LDE5IEBAIHByb3Bl
cnRpZXM6CiAgICAgbWluSXRlbXM6IDEKICAgICBtYXhJdGVtczogNwogCisgIGludGVycnVwdHM6
CisgICAgbWF4SXRlbXM6IDQKKworICBpbnRlcnJ1cHQtbmFtZXM6CisgICAgYW55T2Y6CisgICAg
ICAtIGl0ZW1zOgorICAgICAgICAgIC0gY29uc3Q6IGdsb2JhbAorICAgICAgLSBpdGVtczoKKyAg
ICAgICAgICAtIGNvbnN0OiBicmsKKyAgICAgICAgICAtIGNvbnN0OiB1cAorICAgICAgICAgIC0g
Y29uc3Q6IHRyZy1jb20KKyAgICAgICAgICAtIGNvbnN0OiBjYworCiAgICIjYWRkcmVzcy1jZWxs
cyI6CiAgICAgY29uc3Q6IDEKIAotLSAKMi4zMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
