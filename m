Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA8975091F
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 15:03:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 637CAC6B44D;
	Wed, 12 Jul 2023 13:03:27 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A72CDC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 13:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=SWv7kLrYmL6tIQjmRjFOxpOwGP8K2Po5iCPyo1vXSlQ=; b=jVlbF1vDVDBS3zXUIZ7sTXxL74
 qMOp35rEXSuRBO4gXaIiD5JBYDVQxXiHcsKXPjr06JYWeghGQ1IKgHltx0jk2Zz8CwNtnHAbzwdbb
 4Jht11mON0/Ygfvztu8pEM7lYAhpzUS3uMf5fo0AHrDFCfOIojfLEOdS5D9C4ZZfjOEih+ST8XG/N
 ejnW+sCZzVJY0ImUX9GmIFEqzSbOzmfnSLx4SZXO80wUypF+Cv2RAhyhvRlGLZhrwiE2vkZbfQoPA
 /c3HMKsbZRrLeNlTqflvLuKsz2KfDWqG3VZhnHrPafVbDfhxsA/Y5dUlzUXA8nVgPanPsevfZoIZ5
 KD3nG9fw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qJZBh-000NMh-Fg; Wed, 12 Jul 2023 14:43:21 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1qJZBg-000L9W-R7; Wed, 12 Jul 2023 14:43:20 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: l.goehrs@pengutronix.de, a.fatoum@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 12 Jul 2023 14:42:43 +0200
Message-Id: <20230712124248.2400862-5-sean@geanix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230712124248.2400862-1-sean@geanix.com>
References: <20230712124248.2400862-1-sean@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26967/Wed Jul 12 09:28:32 2023)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dantuguf14105@gmail.com, Sean Nyekjaer <sean@geanix.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 5/9] ARM: dts: stm32: osd32: fix ldo2 not
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
aXMgbm8gaGFyZApyZXF1aXJlbWVudCBmb3IgdGhlIGxkbzIgdG8gYmUgYWx3YXlzLW9uLgoKWzFd
OiBodHRwczovL29jdGF2b3N5c3RlbXMuY29tL2FwcF9ub3Rlcy9vc2QzMm1wMS1wb3dlci1zeXN0
ZW0tb3ZlcnZpZXcvI2Nvbm5lY3Rpb25zCgpTaWduZWQtb2ZmLWJ5OiBTZWFuIE55ZWtqYWVyIDxz
ZWFuQGdlYW5peC5jb20+CkFja2VkLWJ5OiBMZW9uYXJkIEfDtmhycyA8bC5nb2VocnNAcGVuZ3V0
cm9uaXguZGU+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eHgtb3NkMzIuZHRz
aSB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LW9zZDMyLmR0c2kgYi9hcmNoL2FybS9ib290
L2R0cy9zdC9zdG0zMm1wMTV4eC1vc2QzMi5kdHNpCmluZGV4IGViNDNhMWUzYTBjOS4uOTAyY2E2
YzIzNTMzIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4eC1vc2Qz
Mi5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LW9zZDMyLmR0c2kK
QEAgLTEyNCw5ICsxMjQsNyBAQCB2M3YzX2hkbWk6IGxkbzIgewogCQkJCXJlZ3VsYXRvci1uYW1l
ID0gInYzdjNfaGRtaSI7CiAJCQkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzMwMDAwMD47
CiAJCQkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47Ci0JCQkJcmVndWxhdG9y
LWFsd2F5cy1vbjsKIAkJCQlpbnRlcnJ1cHRzID0gPElUX0NVUkxJTV9MRE8yIDA+OwotCiAJCQl9
OwogCiAJCQl2dHRfZGRyOiBsZG8zIHsKLS0gCjIuNDAuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
