Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E572C8AA7DB
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 07:02:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B16D3C6DD9C;
	Fri, 19 Apr 2024 05:02:45 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A3F6C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 05:02:44 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A605188634;
 Fri, 19 Apr 2024 07:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713502964;
 bh=dXiSdXuRjgL9KxkWcT7+OJC9xqL1AyLvonePWQeFAz8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CDwI4y4WQ8MRkNLq1r4HmvBgudfM7QIfWjRCXzTTHTRZ22gnQuIFcdpXPmSOX3mKH
 yOj0a/3g7Y1gedU6xv5aI45aqLrhGNGlfHzw4ALQBQxpqz3Nf+ZGxraQdlg55FoEh5
 4q8pbaL9ssohq8GKX00afZT8Fvnp4qQ7fo1VyWXi2T7GHCVcoN6TPzLMUO2xXvoEyN
 37wLFdsOmfHwe2NwAgp3k41l9RuOgYx0JU9tPWyaAwpvbU3u/tfgfzcVBQW8lywDvg
 lSdM4ab8j2cnfnEuAcwoY84063hKC4ltcLux/AbMWMZtH0IfYd1d8fzL8JMftCByWf
 O+M0eFcNXjPZg==
From: Marek Vasut <marex@denx.de>
To: linux-crypto@vger.kernel.org
Date: Fri, 19 Apr 2024 07:01:14 +0200
Message-ID: <20240419050201.181041-3-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240419050201.181041-1-marex@denx.de>
References: <20240419050201.181041-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Yang Yingliang <yangyingliang@huawei.com>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] hwrng: stm32 - repair clock handling
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

VGhlIGNsb2NrIG1hbmFnZW1lbnQgaW4gdGhpcyBkcml2ZXIgZG9lcyBub3Qgc2VlbSB0byBiZSBj
b3JyZWN0LiBUaGUKc3RydWN0IGh3cm5nIC5pbml0IGNhbGxiYWNrIGVuYWJsZXMgdGhlIGNsb2Nr
LCBidXQgdGhlcmUgaXMgbm8gbWF0Y2hpbmcKLmNsZWFudXAgY2FsbGJhY2sgdG8gZGlzYWJsZSB0
aGUgY2xvY2suIFRoZSBjbG9jayBnZXQgZGlzYWJsZWQgYXMgc29tZQpsYXRlciBwb2ludCBieSBy
dW50aW1lIFBNIHN1c3BlbmQgY2FsbGJhY2suCgpGdXJ0aGVybW9yZSwgYm90aCBydW50aW1lIFBN
IGFuZCBzbGVlcCBzdXNwZW5kIGNhbGxiYWNrcyBhY2Nlc3MgcmVnaXN0ZXJzCmZpcnN0IGFuZCBk
aXNhYmxlIGNsb2NrIHdoaWNoIGFyZSB1c2VkIGZvciByZWdpc3RlciBhY2Nlc3Mgc2Vjb25kLiBJ
ZiB0aGUKSVAgaXMgYWxyZWFkeSBpbiBSUE0gc3VzcGVuZCBhbmQgdGhlIHN5c3RlbSBlbnRlcnMg
c2xlZXAgc3RhdGUsIHRoZSBzbGVlcApjYWxsYmFjayB3aWxsIGF0dGVtcHQgdG8gYWNjZXNzIHJl
Z2lzdGVycyB3aGlsZSB0aGUgcmVnaXN0ZXIgY2xvY2sgYXJlCmFscmVhZHkgZGlzYWJsZWQuIFRo
aXMgYnVnIGhhcyBiZWVuIGZpeGVkIG9uY2UgYmVmb3JlIGFscmVhZHkgaW4gY29tbWl0CjliYWU1
NDk0MmIxMyAoImh3cm5nOiBzdG0zMiAtIGZpeCBwbV9zdXNwZW5kIGlzc3VlIiksIGFuZCByZWdy
ZXNzZWQgaW4KY29tbWl0IGZmNGU0NjEwNGYyZSAoImh3cm5nOiBzdG0zMiAtIHJld29yayBwb3dl
ciBtYW5hZ2VtZW50IHNlcXVlbmNlcyIpIC4KCkZpeCB0aGlzIHNsaWdodGx5IGRpZmZlcmVudGx5
LCBkaXNhYmxlIHJlZ2lzdGVyIGNsb2NrIGF0IHRoZSBlbmQgb2YgLmluaXQKY2FsbGJhY2ssIHRo
aXMgd2F5IHRoZSBJUCBpcyBkaXNhYmxlZCBhZnRlciAuaW5pdC4gT24gZXZlcnkgYWNjZXNzIHRv
IHRoZQpJUCwgd2hpY2ggcmVhbGx5IGlzIG9ubHkgc3RtMzJfcm5nX3JlYWQoKSwgZG8gcG1fcnVu
dGltZV9nZXRfc3luYygpIHdoaWNoCmlzIGFscmVhZHkgZG9uZSBpbiBzdG0zMl9ybmdfcmVhZCgp
IHRvIGJyaW5nIHRoZSBJUCBmcm9tIFJQTSBzdXNwZW5kLCBhbmQKcG1fcnVudGltZV9tYXJrX2xh
c3RfYnVzeSgpL3BtX3J1bnRpbWVfcHV0X3N5bmNfYXV0b3N1c3BlbmQoKSB0byBwdXQgaXQKYmFj
ayBpbnRvIFJQTSBzdXNwZW5kLgoKQ2hhbmdlIHNsZWVwIHN1c3BlbmQvcmVzdW1lIGNhbGxiYWNr
cyB0byBlbmFibGUgYW5kIGRpc2FibGUgcmVnaXN0ZXIgY2xvY2sKYXJvdW5kIHJlZ2lzdGVyIGFj
Y2VzcywgYXMgdGhvc2UgY2Fubm90IHVzZSB0aGUgUlBNIHN1c3BlbmQvcmVzdW1lIGNhbGxiYWNr
cwpkdWUgdG8gc2xpZ2h0bHkgZGlmZmVyZW50IGluaXRpYWxpemF0aW9uIGluIHRob3NlIHNsZWVw
IGNhbGxiYWNrcy4gVGhpcyB3YXksCnRoZSByZWdpc3RlciBhY2Nlc3Mgc2hvdWxkIGFsd2F5cyBi
ZSBwZXJmb3JtZWQgd2l0aCBjbG9jayBzdXJlbHkgZW5hYmxlZC4KCkZpeGVzOiBmZjRlNDYxMDRm
MmUgKCJod3JuZzogc3RtMzIgLSByZXdvcmsgcG93ZXIgbWFuYWdlbWVudCBzZXF1ZW5jZXMiKQpT
aWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KLS0tCkNjOiAiVXdlIEts
ZWluZS1Lw7ZuaWciIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CkNjOiBBbGV4YW5k
cmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPgpDYzogR2F0aWVuIENoZXZh
bGxpZXIgPGdhdGllbi5jaGV2YWxsaWVyQGZvc3Muc3QuY29tPgpDYzogSGVyYmVydCBYdSA8aGVy
YmVydEBnb25kb3IuYXBhbmEub3JnLmF1PgpDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4u
c3RtMzJAZ21haWwuY29tPgpDYzogT2xpdmlhIE1hY2thbGwgPG9saXZpYUBzZWxlbmljLmNvbT4K
Q2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNjOiBZYW5nIFlpbmdsaWFuZyA8eWFu
Z3lpbmdsaWFuZ0BodWF3ZWkuY29tPgpDYzoga2VybmVsQGRoLWVsZWN0cm9uaWNzLmNvbQpDYzog
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1jcnlwdG9Admdl
ci5rZXJuZWwub3JnCkNjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Ci0tLQogZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1ybmcuYyB8IDkgKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jaGFy
L2h3X3JhbmRvbS9zdG0zMi1ybmcuYyBiL2RyaXZlcnMvY2hhci9od19yYW5kb20vc3RtMzItcm5n
LmMKaW5kZXggYjYxODJmODZkOGE0Yi4uMGU5MDNkNmUyMmUzMCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1ybmcuYworKysgYi9kcml2ZXJzL2NoYXIvaHdfcmFuZG9t
L3N0bTMyLXJuZy5jCkBAIC0zNjMsNiArMzYzLDggQEAgc3RhdGljIGludCBzdG0zMl9ybmdfaW5p
dChzdHJ1Y3QgaHdybmcgKnJuZykKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCisJY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlKHByaXYtPmNsayk7CisKIAlyZXR1cm4gMDsKIH0KIApAQCAtMzg3LDYgKzM4
OSwxMSBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0bTMyX3JuZ19ydW50aW1lX3N1c3Bl
bmQoc3RydWN0IGRldmljZSAqZGV2KQogc3RhdGljIGludCBfX21heWJlX3VudXNlZCBzdG0zMl9y
bmdfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IHN0bTMyX3JuZ19wcml2
YXRlICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CisJaW50IGVycjsKKworCWVyciA9IGNs
a19wcmVwYXJlX2VuYWJsZShwcml2LT5jbGspOworCWlmIChlcnIpCisJCXJldHVybiBlcnI7CiAK
IAlpZiAocHJpdi0+ZGF0YS0+aGFzX2NvbmRfcmVzZXQpIHsKIAkJcHJpdi0+cG1fY29uZi5uc2Ny
ID0gcmVhZGxfcmVsYXhlZChwcml2LT5iYXNlICsgUk5HX05TQ1IpOwpAQCAtNDY4LDYgKzQ3NSw4
IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3RtMzJfcm5nX3Jlc3VtZShzdHJ1Y3QgZGV2
aWNlICpkZXYpCiAJCXdyaXRlbF9yZWxheGVkKHJlZywgcHJpdi0+YmFzZSArIFJOR19DUik7CiAJ
fQogCisJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPmNsayk7CisKIAlyZXR1cm4gMDsKIH0K
IAotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
