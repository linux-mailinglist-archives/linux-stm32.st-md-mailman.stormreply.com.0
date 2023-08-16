Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F13A777E17B
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 14:25:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACA3CC6C822;
	Wed, 16 Aug 2023 12:25:19 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7792C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 12:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=5m/fvZz+JMQxGsGCGL8BSOhcb0aYS9xdwb43uJTU/c0=; b=Cbj/4xV64F1pKBdJpybpmQ3/0o
 bSgUt3eWYGxXNWd5oG6U97/7t81JCHitQvfQVn9NqX3Q5DW1i1HaGsp0yqGC4XyU7xtViugcPaXcK
 ZtoZN70gbOOg4Rfk0o6YzzFxxbAnXiAiC6e7pzYlbn9fUGW03K0LkRR68eAcZ0fsc1mixvffxXXdA
 44jFEYr3hc/27dMu1sCKPLnTPznyAlNXiAmDRmg4RmaEDHQuolvRLKiW9JCD1vmJhhTFhMFph+Oi5
 Y8auJ/ikrafJ9i+JnzE1dWEprphBZesAXLi3udp3vKgcWHRXjfuPoYD7VDrfuueUDvZueHOoy50ve
 sNdVMCzw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qWFaK-000NBv-Ei; Wed, 16 Aug 2023 14:25:12 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1qWFaJ-000HIl-Nr; Wed, 16 Aug 2023 14:25:11 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: l.goehrs@pengutronix.de, a.fatoum@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 16 Aug 2023 14:24:27 +0200
Message-ID: <20230816122435.3153513-7-sean@geanix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816122435.3153513-1-sean@geanix.com>
References: <20230816122435.3153513-1-sean@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27002/Wed Aug 16 09:38:26 2023)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dantuguf14105@gmail.com, Sean Nyekjaer <sean@geanix.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 7/9] ARM: dts: stm32: osd32: fix ldo6 not
	required to be always-on
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

QWNjb3JkaW5nIHRvIHRoZSBPU0QzMk1QMSBQb3dlciBTeXN0ZW0gb3ZlcnZpZXdbMV0gdGhlcmUg
aXMgbm8gaGFyZApyZXF1aXJlbWVudCBmb3IgdGhlIGxkbzYgdG8gYmUgYWx3YXlzLW9uLgoKWzFd
OiBodHRwczovL29jdGF2b3N5c3RlbXMuY29tL2FwcF9ub3Rlcy9vc2QzMm1wMS1wb3dlci1zeXN0
ZW0tb3ZlcnZpZXcvI2Nvbm5lY3Rpb25zCgpTaWduZWQtb2ZmLWJ5OiBTZWFuIE55ZWtqYWVyIDxz
ZWFuQGdlYW5peC5jb20+CkFja2VkLWJ5OiBMZW9uYXJkIEfDtmhycyA8bC5nb2VocnNAcGVuZ3V0
cm9uaXguZGU+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eHgtb3NkMzIuZHRz
aSB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LW9zZDMyLmR0c2kgYi9hcmNoL2FybS9ib290
L2R0cy9zdC9zdG0zMm1wMTV4eC1vc2QzMi5kdHNpCmluZGV4IDkwMmNhNmMyMzUzMy4uYWViNzFj
NDFhNzM0IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4eC1vc2Qz
Mi5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LW9zZDMyLmR0c2kK
QEAgLTE1Miw5ICsxNTIsNyBAQCB2MXYyX2hkbWk6IGxkbzYgewogCQkJCXJlZ3VsYXRvci1uYW1l
ID0gInYxdjJfaGRtaSI7CiAJCQkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTIwMDAwMD47
CiAJCQkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTIwMDAwMD47Ci0JCQkJcmVndWxhdG9y
LWFsd2F5cy1vbjsKIAkJCQlpbnRlcnJ1cHRzID0gPElUX0NVUkxJTV9MRE82IDA+OwotCiAJCQl9
OwogCiAJCQl2cmVmX2RkcjogdnJlZl9kZHIgewotLSAKMi40MS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
