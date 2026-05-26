Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIaYGBWJFWqGWQcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 13:50:45 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0265E5D527D
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 13:50:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F18F1C5A4C5;
	Tue, 26 May 2026 11:50:43 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F38EC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 09:12:13 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-44e5624c053so6177664f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 02:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779786733; x=1780391533;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XVdGlC73dpgrqg3jmTOepym9CG4JSTdsRd09/R/VHZ8=;
 b=RsdVpp86seAvFZ3AsUbErpcDcGfHsekj6a2f9bz1rr5DuK1vnLM5FEF6SJhSUFbhrD
 /qN0PsvdTbdglY3zGs/yzcDY4ugBhRhxm4yYvl6yuyLj49SAjIEPwFrJUPltGsX1gl5h
 zqT9h6/ISdar+vYuThv9zZJuBa4qQui41WiFGuDHJMplKJHXlGK/VU+umcQBDtYdgQbv
 qrB8T4px6ndaWZeV29gNt7lYr0oz2XFiy/oyLuRaCUtxE6QDZFLaLlEd57CBNgssXdtY
 pYfv7DzLLNVn+qd+2Ppm4TiNMPxj3O7fEFHbaIuPYbBBTA+5ic8buzGQ2M8CVKACCXzk
 Ig3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779786733; x=1780391533;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVdGlC73dpgrqg3jmTOepym9CG4JSTdsRd09/R/VHZ8=;
 b=ENu/y12GsBdUa1VLl2g/lx9OgGlEcgxYDQzSJhJ6/RpKQgO1PEwZX/zjKdb7JVBd6g
 Rk0UPsJyoG9fHVFvo+Wg+6BwTVmCexE0SadYPNbaMz2KYpGfK9RYSG9y4aksy2MG2jvd
 XhegpsC+s6o9vdhWmuig0005TznvXUsZPp1GGXkF1VUs8qwBO3DFaOy8Q+7AiOgvJAqO
 z10d+6BBRFB1hzsgyELCFOf7rt0GcO6SNQE54t2kmBxUELXg5wvCSupU7z+cp4jPSLnK
 tVHmfYLy5XMR7SNN7oIePv8ECaOWaypvK1q8x464k4rf6t5Rp7ZHsWWOi1PT2AAcJYRQ
 UUrg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9tEYbuJrOIaA6oCp53y67Q00d/yUPIpvS1PWshsppM5a3ALCyRfP01FO2X5JPBg4YVGxDP/kmfJGzsfg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwWNcBzpkFft84AHE+z09kaq38hTxhXSwhk5bXfCcqJ3ZOsRpqC
 sy8SjyiKNLL661mKR4lXuptYjM6hxwScl4tL0QdMVnsL1IgzGlKAaifo
X-Gm-Gg: Acq92OE0hbnrb3JMN/BC9uzK8jpxE4mvkMBWqctYeu3OpB6L8X7fdl3QDa3U7YeovK9
 sGtzo5VuILn4fc+2gYfrqg70gbiCggbOepR1+/7AYYPi5XZkTMGYXWquDTy78qa2FvEVlhrGCee
 KLNBTu8IgiJEggNPkWyHKZuREKtxtd7pY6UZzAIzYMuXNga7Zk5v20xaBDQjd85Yhj1c3qTt9j0
 kCx6w8v0ljCZS2ZfCOjBE9ST1axeUETIa0zIBx8JPtt0leV1RkGmM0wSwiN392jVYQBii18D9D+
 wrWdaw0LkwFSbsq1aHV8V+0z20h/eWph3ybRBMGb6drsVBdseFZvrpoym/3LTOnhMhC1++Jk5EZ
 GabzmTcvx5w0T/1O6fjy0wbwwrXE1h7WSnRJJnffEn7LvezfYvLCAgI+aCgb5cKc3WR2YPoqrvv
 2KTW8uR4n+W26pM7RtDOQyaChaho9t7jXMLo7lLPcfnrXMiCytnyU2o/dJrNW0KVxo7DYAmBO54
 qfKmqIRnbFwqg==
X-Received: by 2002:a05:6000:1a87:b0:43f:e2b7:7160 with SMTP id
 ffacd0b85a97d-45eb3673319mr31634787f8f.4.1779786732366; 
 Tue, 26 May 2026 02:12:12 -0700 (PDT)
Received: from localhost.localdomain ([90.173.102.44])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d5e363sm34749267f8f.28.2026.05.26.02.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 02:12:11 -0700 (PDT)
From: =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Wolfram Sang <wsa@kernel.org>
Date: Tue, 26 May 2026 11:12:09 +0200
Message-Id: <20260526091210.20383-1-guille.rodriguez@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 26 May 2026 11:50:42 +0000
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] i2c: stm32f7: fix timing computation ignoring
	i2c-analog-filter
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
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pierre-yves.mordret@foss.st.com,m:alain.volmat@foss.st.com,m:andi.shyti@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wsa@kernel.org,m:linux-kernel@vger.kernel.org,m:guille.rodriguez@gmail.com,m:linux-i2c@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelinstm32@gmail.com,m:guillerodriguez@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[guillerodriguez@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[guillerodriguez@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.infradead.org,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.766];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0265E5D527D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

c3RtMzJmN19pMmNfY29tcHV0ZV90aW1pbmcoKSB1c2VzIGkyY19kZXYtPmFuYWxvZ19maWx0ZXIg
dG8gcGljawp0aGUgYW5hbG9nIGZpbHRlciBkZWxheSwgYnV0IGkyY19kZXYtPmFuYWxvZ19maWx0
ZXIgaXMgcGFyc2VkIGZyb20KdGhlICJpMmMtYW5hbG9nLWZpbHRlciIgRFQgcHJvcGVydHkgb25s
eSBhZnRlciB0aGUgY29tcHV0ZV90aW1pbmcKbG9vcCBpbiBzdG0zMmY3X2kyY19zZXR1cF90aW1p
bmcoKSwgc28gaW4gcHJhY3RpY2UgdGhlIHRpbWluZwpjYWxjdWxhdGlvbnMgYWx3YXlzIGlnbm9y
ZSB0aGUgYW5hbG9nIGZpbHRlci4gT24gYW4gU1RNMzJNUDEgYm9hcmQKd2l0aCBjbG9jay1mcmVx
dWVuY3kgPSA8NDAwMDAwPiBhbmQgaTJjLWFuYWxvZy1maWx0ZXIgc2V0LCBtZWFzdXJlZApTQ0wg
ZnJlcXVlbmN5IHdhcyB+MzgyIGtIei4KClRoaXMgYWxzbyBhZmZlY3RzICh3aWRlbnMpIHRoZSBj
b21wdXRlZCBTREFERUwgcmFuZ2UuIEF0IGhpZ2ggYnVzCmNsb2NrIHNwZWVkcywgdGhpcyBjYW4g
c2VsZWN0IGFuIFNEQURFTCB2YWx1ZSB0aGF0IHZpb2xhdGVzIHRWRDtEQVQKKGRhdGEgdmFsaWQg
dGltZSkuCgpGaXggYnkgcGFyc2luZyAiaTJjLWFuYWxvZy1maWx0ZXIiIGJlZm9yZSB0aGUgY29t
cHV0ZV90aW1pbmcgbG9vcC4KCkZpeGVzOiA4M2MzNDA4ZjdiOWMgKCJpMmM6IHN0bTMyZjc6IHN1
cHBvcnQgRFQgYmluZGluZyBpMmMtYW5hbG9nLWZpbHRlciIpCkNjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnClNpZ25lZC1vZmYtYnk6IEd1aWxsZXJtbyBSb2Ryw61ndWV6IDxndWlsbGUucm9kcmln
dWV6QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYyB8IDYg
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jIGIvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1zdG0zMmY3LmMKaW5kZXggNTNkOWRmNzBlYmU0Li4wNjdhZjI1NWJkMjIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jCisrKyBiL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jCkBAIC02OTQsNiArNjk0LDkgQEAgc3RhdGljIGlu
dCBzdG0zMmY3X2kyY19zZXR1cF90aW1pbmcoc3RydWN0IHN0bTMyZjdfaTJjX2RldiAqaTJjX2Rl
diwKIAlpZiAoIW9mX3Byb3BlcnR5X3JlYWRfYm9vbChpMmNfZGV2LT5kZXYtPm9mX25vZGUsICJp
MmMtZGlnaXRhbC1maWx0ZXIiKSkKIAkJaTJjX2Rldi0+ZG5mX2R0ID0gU1RNMzJGN19JMkNfRE5G
X0RFRkFVTFQ7CiAKKwlpMmNfZGV2LT5hbmFsb2dfZmlsdGVyID0gb2ZfcHJvcGVydHlfcmVhZF9i
b29sKGkyY19kZXYtPmRldi0+b2Zfbm9kZSwKKwkJCQkJCSAgICAgICAiaTJjLWFuYWxvZy1maWx0
ZXIiKTsKKwogCWRvIHsKIAkJcmV0ID0gc3RtMzJmN19pMmNfY29tcHV0ZV90aW1pbmcoaTJjX2Rl
diwgc2V0dXAsCiAJCQkJCQkgJmkyY19kZXYtPnRpbWluZyk7CkBAIC03MTUsOSArNzE4LDYgQEAg
c3RhdGljIGludCBzdG0zMmY3X2kyY19zZXR1cF90aW1pbmcoc3RydWN0IHN0bTMyZjdfaTJjX2Rl
diAqaTJjX2RldiwKIAkJcmV0dXJuIHJldDsKIAl9CiAKLQlpMmNfZGV2LT5hbmFsb2dfZmlsdGVy
ID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKGkyY19kZXYtPmRldi0+b2Zfbm9kZSwKLQkJCQkJCSAg
ICAgICAiaTJjLWFuYWxvZy1maWx0ZXIiKTsKLQogCWRldl9kYmcoaTJjX2Rldi0+ZGV2LCAiSTJD
IFNwZWVkKCVpKSwgQ2xrIFNvdXJjZSglaSlcbiIsCiAJCXNldHVwLT5zcGVlZF9mcmVxLCBzZXR1
cC0+Y2xvY2tfc3JjKTsKIAlkZXZfZGJnKGkyY19kZXYtPmRldiwgIkkyQyBSaXNlKCVpKSBhbmQg
RmFsbCglaSkgVGltZVxuIiwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
