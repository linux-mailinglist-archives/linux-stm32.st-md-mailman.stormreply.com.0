Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C65CFC096FB
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Oct 2025 18:26:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CB52C36B2A;
	Sat, 25 Oct 2025 16:26:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E229C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Oct 2025 16:26:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5475C601E8;
 Sat, 25 Oct 2025 16:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3330C19421;
 Sat, 25 Oct 2025 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761409613;
 bh=Pyi/deS0BK1bu5+MfdJKjF/aJj54u1WpI9UwOtwyXzY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VpWurLt4sZ1WGpYJcUKZfXotlmn3+SYqt7y4SbGyIQH/bxg5ZdMXKyDTVqUXWjKnz
 yA3XQq1ESDABBZntDvAJ/C/Ytug7bvLrDamz4GRyY+1bs/3gZ8/mGKgNKeFm50tWdW
 Fpmqxf/+4yuC/CPA6q+O0Nmv0TBvGFDPH1vyMNHPh4E6AIvqWmVzrzHj6FP3kd0kNk
 shOFhnUqUU/0Oo46R6Y7HSAPQvPq1vtJzD2k/qlfIUmZodZ1IN1ZAOQtyY0/N+yT1O
 6wMdGbuyJGjMAjBYWXmbF+r5pttDGktZB6QXE080MIfY8KIy4GhPtgPYfhBhxOzXcl
 F0ruSfp7ApYyQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Sat, 25 Oct 2025 12:00:24 -0400
Message-ID: <20251025160905.3857885-393-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Cc: Sasha Levin <sashal@kernel.org>, linux-sound@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 6.17-6.6] ASoC: stm32: sai: manage
	context in set_sysclk callback
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

RnJvbTogT2xpdmllciBNb3lzYW4gPG9saXZpZXIubW95c2FuQGZvc3Muc3QuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgMjdmYTFhOGIyODAzZGZkODhjMzlmMDNiMDk2OWM1NWY2NjdjZGM0MyBdCgpU
aGUgbWNsayBkaXJlY3Rpb24gbm93IG5lZWRzIHRvIGJlIHNwZWNpZmllZCBpbiBlbmRwb2ludCBu
b2RlIHdpdGgKInN5c3RlbS1jbG9jay1kaXJlY3Rpb24tb3V0IiBwcm9wZXJ0eS4gSG93ZXZlciBz
b21lIGNhbGxzIHRvIHRoZQpzZXRfc3lzY2xrIGNhbGxiYWNrLCByZWxhdGVkIHRvIENQVSBEQUkg
Y2xvY2ssIHJlc3VsdCBpbiB1bmJhbGFuY2VkCmNhbGxzIHRvIGNsb2NrIEFQSS4KVGhlIHNldF9z
eXNjbGsgY2FsbGJhY2sgaW4gU1RNMzIgU0FJIGRyaXZlciBpcyBpbnRlbmRlZCBvbmx5IGZvciBt
Y2xrCm1hbmFnZW1lbnQuIFNvIGl0IGlzIHJlbGV2YW50IHRvIGVuc3VyZSB0aGF0IGNhbGxzIHRv
IHNldF9zeXNjbGsgYXJlCnJlbGF0ZWQgdG8gbWNsayBvbmx5LgpTaW5jZSB0aGUgbWFzdGVyIGNs
b2NrIGlzIGhhbmRsZWQgb25seSBhdCBydW50aW1lLCBza2lwIHRoZSBjYWxscyB0bwpzZXRfc3lz
Y2xrIGluIHRoZSBpbml0aWFsaXphdGlvbiBwaGFzZS4KClNpZ25lZC1vZmYtYnk6IE9saXZpZXIg
TW95c2FuIDxvbGl2aWVyLm1veXNhbkBmb3NzLnN0LmNvbT4KTGluazogaHR0cHM6Ly9wYXRjaC5t
c2dpZC5saW5rLzIwMjUwOTE2MTIzMTE4Ljg0MTc1LTEtb2xpdmllci5tb3lzYW5AZm9zcy5zdC5j
b20KU2lnbmVkLW9mZi1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgpTaWduZWQt
b2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQoKTExNIEdlbmVyYXRl
ZCBleHBsYW5hdGlvbnMsIG1heSBiZSBjb21wbGV0ZWx5IGJvZ3VzOgoKWUVTCi0gR3VhcmRpbmcg
YHN0bTMyX3NhaV9zZXRfc3lzY2xrKClgIHVudGlsIHRoZSBjYXJkIGlzIGluc3RhbnRpYXRlZAog
IChgc291bmQvc29jL3N0bS9zdG0zMl9zYWlfc3ViLmM6Njc1LTY4MWApIHByZXZlbnRzIHRoZSBl
YXJseSBzaW1wbGUtCiAgY2FyZCBgaW5pdGAgY2FsbCAoYHNvdW5kL3NvYy9nZW5lcmljL3NpbXBs
ZS1jYXJkLXV0aWxzLmM6NTcxYCkgZnJvbQogIHByb2dyYW1taW5nIGNsb2NrcyBiZWZvcmUgcnVu
dGltZS4KLSBUaGF0IGluaXQtdGltZSBjYWxsIGN1cnJlbnRseSB0cmlnZ2VycyBhIHNlY29uZAog
IGBjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0KClgIG9uIHRoZSBzaGFyZWQgU0FJIGtlcm5lbCBjbG9j
awogIChgc291bmQvc29jL3N0bS9zdG0zMl9zYWlfc3ViLmM6NDQyYCkgYW5kIGFub3RoZXIKICBg
Y2xrX3NldF9yYXRlX2V4Y2x1c2l2ZSgpYCBvbiB0aGUgTUNMSwogIChgc291bmQvc29jL3N0bS9z
dG0zMl9zYWlfc3ViLmM6NzA5YCkgYmVmb3JlIGFueSBtYXRjaGluZyDigJww4oCvSHrigJ0KICB0
ZWFyZG93biBoYXBwZW5zOyBhdCBzaHV0ZG93biB3ZSBvbmx5IGRyb3Agb25lIHJlZmVyZW5jZQog
IChgc291bmQvc29jL3N0bS9zdG0zMl9zYWlfc3ViLmM6NjkyLTcwMmApLCBsZWF2aW5nIHRoZSBj
bG9ja3MKICBwZXJtYW5lbnRseSBsb2NrZWQgYW5kIGNhdXNpbmcgbGF0ZXIgYC1FQlVTWWAgZmFp
bHVyZXMuCi0gVGhlIHJlZ3Jlc3Npb24gc2hvd3MgdXAgYXMgc29vbiBhcyBib2FyZHMgdGFnIHRo
ZSBDUFUgZW5kcG9pbnQgd2l0aAogIGBzeXN0ZW0tY2xvY2stZGlyZWN0aW9uLW91dGAgKHBhcnNl
ZCBpbiBgc2ltcGxlLWNhcmQtdXRpbHMuYzoyOTBgIGFuZAogIGFscmVhZHkgcHJlc2VudCBpbiBT
VOKAmXMgc2hpcHBpbmcgRFRzIHN1Y2ggYXMKICBgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJt
cDE1eHgtZGt4LmR0c2k6NTIwYCksIGEgY29uZmlndXJhdGlvbgogIGVuY291cmFnZWQgc2luY2Ug
Y29tbWl0IDU3MjViY2U3MDlkYjsgdGhlIGV4Y2x1c2l2ZSBjbG9jayBtYW5hZ2VtZW50CiAgYWRk
ZWQgaW4gMmNmZTFmZjIyNTU1IG1hZGUgdGhlIGltYmFsYW5jZSBmYXRhbC4KLSBUaGUgZml4IGlz
IG1pbmltYWwgYW5kIGNvbnRhaW5lZDogaXQgc2ltcGx5IHNraXBzIHRoZSBpbml0LXBoYXNlCiAg
aW52b2NhdGlvbiBmb3IgYSBkcml2ZXIgdGhhdCBhbHJlYWR5IGRlcml2ZXMgTUNMSyBmcm9tIHRo
ZSBzdHJlYW0KICByYXRlLCBzbyB0aGUgcmlzayBvZiByZWdyZXNzaW9ucyBpcyBsb3cgd2hpbGUg
aXQgcmVzb2x2ZXMgYSByZWFsCiAgcnVudGltZSBidWcgb24gY3VycmVudCBoYXJkd2FyZS4KCiBz
b3VuZC9zb2Mvc3RtL3N0bTMyX3NhaV9zdWIuYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc3RtL3N0bTMyX3NhaV9z
dWIuYyBiL3NvdW5kL3NvYy9zdG0vc3RtMzJfc2FpX3N1Yi5jCmluZGV4IDQ2M2EyYjdkMDIzYjku
LjBhZTFlYWUyYTU5ZTIgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zdG0vc3RtMzJfc2FpX3N1Yi5j
CisrKyBiL3NvdW5kL3NvYy9zdG0vc3RtMzJfc2FpX3N1Yi5jCkBAIC02NzIsNiArNjcyLDE0IEBA
IHN0YXRpYyBpbnQgc3RtMzJfc2FpX3NldF9zeXNjbGsoc3RydWN0IHNuZF9zb2NfZGFpICpjcHVf
ZGFpLAogCXN0cnVjdCBzdG0zMl9zYWlfc3ViX2RhdGEgKnNhaSA9IHNuZF9zb2NfZGFpX2dldF9k
cnZkYXRhKGNwdV9kYWkpOwogCWludCByZXQ7CiAKKwkvKgorCSAqIFRoZSBtY2xrIHJhdGUgaXMg
ZGV0ZXJtaW5lZCBhdCBydW50aW1lIGZyb20gdGhlIGF1ZGlvIHN0cmVhbSByYXRlLgorCSAqIFNr
aXAgY2FsbHMgdG8gdGhlIHNldF9zeXNjbGsgY2FsbGJhY2sgdGhhdCBhcmUgbm90IHJlbGV2YW50
IGR1cmluZyB0aGUKKwkgKiBpbml0aWFsaXphdGlvbiBwaGFzZS4KKwkgKi8KKwlpZiAoIXNuZF9z
b2NfY2FyZF9pc19pbnN0YW50aWF0ZWQoY3B1X2RhaS0+Y29tcG9uZW50LT5jYXJkKSkKKwkJcmV0
dXJuIDA7CisKIAlpZiAoZGlyID09IFNORF9TT0NfQ0xPQ0tfT1VUICYmIHNhaS0+c2FpX21jbGsp
IHsKIAkJcmV0ID0gc3RtMzJfc2FpX3N1Yl9yZWdfdXAoc2FpLCBTVE1fU0FJX0NSMV9SRUdYLAog
CQkJCQkgICBTQUlfWENSMV9OT0RJViwKLS0gCjIuNTEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
