Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BBB6B0F2D
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 17:50:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8068C6A5E8;
	Wed,  8 Mar 2023 16:49:59 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7549C6907B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Mar 2023 16:26:32 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 fr5-20020a17090ae2c500b0023af8a036d2so2130082pjb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Mar 2023 08:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678292791;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LQUZMW3ATClSf/r8H/ZNppEXmMdqJP2TRdMQdlzdBEU=;
 b=vFtvmMzQxe24kUWiqouCP+6ADVFP/PT1DDraPJzIymkIRLgRZ6mLC2lxVzbeYo06Cv
 Be+vb8NMVS5mbBHWPMsnQq/H0OcmBD+nBsZyOQbHXdoIuGqxw9KgAwiD8CeS1APTsRuq
 S4xkTmG529TaeG2hpvomYYa9t1L4Mzwhs+NDHaLKdYpjn42h2Yht6qcU7beinon2ftDq
 zv5ynPP45qA5g2hoLgyFjfh0T5qeeMRuZ1WaeyoPy3vqG2mPkWEbG70c4JoBwX40PBl9
 KU9DjxQjxsSvm68Fwm9MrbRqOTBaU2NGkFg8aqk5XzU5BuRWtOuYXUdqh2bMkHzY8iJC
 19qg==
X-Gm-Message-State: AO0yUKUxQV1MItNB+uIlj1EedEUxpYeEhGImPL5LSPld7p67q/eHnRZP
 Qg44EzFKsITqzfvAUB02s3I=
X-Google-Smtp-Source: AK7set/ljF2NSlK5iXBS5nOBvYwYALtBT6qGPN3NaOl9NmTJAqQftRWcEmjCkHVWk/x0lRsa1htRvA==
X-Received: by 2002:a17:90b:1b0f:b0:237:c18d:c459 with SMTP id
 nu15-20020a17090b1b0f00b00237c18dc459mr19250067pjb.31.1678292791395; 
 Wed, 08 Mar 2023 08:26:31 -0800 (PST)
Received: from localhost.localdomain ([14.4.134.166])
 by smtp.gmail.com with ESMTPSA id
 mv15-20020a17090b198f00b0023087e8adf8sm9363818pjb.21.2023.03.08.08.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:26:31 -0800 (PST)
From: Leesoo Ahn <lsahn@ooseel.net>
To: lsahn@ooseel.net
Date: Thu,  9 Mar 2023 01:26:18 +0900
Message-Id: <20230308162619.329372-1-lsahn@ooseel.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Mar 2023 16:49:58 +0000
Cc: linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: call
	stmmac_finalize_xdp_rx() on a condition
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

VGhlIGN1cnJlbnQgY29kZWJhc2UgY2FsbHMgdGhlIGZ1bmN0aW9uIG5vIG1hdHRlciBuZXQgZGV2
aWNlIGhhcyBYRFAKcHJvZ3JhbXMgb3Igbm90LiBTbyB0aGUgZmluYWxpemUgZnVuY3Rpb24gaXMg
YmVpbmcgY2FsbGVkIGV2ZXJ5dGltZSB3aGVuIFJYCmJvdHRvbS1oYWxmIGluIHByb2dyZXNzLiBJ
dCBuZWVkcyBhIGZldyBtYWNoaW5lIGluc3RydWN0aW9ucyBmb3Igbm90aGluZwppbiB0aGUgY2Fz
ZSB0aGF0IFhEUCBwcm9ncmFtcyBhcmUgbm90IGF0dGFjaGVkIGF0IGFsbC4KCkxldHMgaXQgY2Fs
bCB0aGUgZnVuY3Rpb24gb24gYSBjb25kaXRpb24gdGhhdCBpZiB4ZHBfc3RhdHVzIHZhcmlhYmxl
IGhhcwpub3QgemVybyB2YWx1ZS4gVGhhdCBtZWFucyBYRFAgcHJvZ3JhbXMgYXJlIGF0dGFjaGVk
IHRvIHRoZSBuZXQgZGV2aWNlCmFuZCBpdCBzaG91bGQgYmUgZmluYWxpemVkIGJhc2VkIG9uIHRo
ZSB2YXJpYWJsZS4KClRoZSBmb2xsb3dpbmcgaW5zdHJ1Y3Rpb25zIHNob3cgdGhhdCBpdCdzIGJl
dHRlciB0aGFuIGNhbGxpbmcgdGhlIGZ1bmN0aW9uCnVuY29uZGl0aW9uYWxseS4KCiAgMC4zMSDi
lII2Yjg6ICAgbGRyICAgICB3MCwgW3NwLCAjMTk2XQogICAgICAg4pSCICAgIOKUjOKUgOKUgGNi
eiAgICAgdzAsIDZjYwogICAgICAg4pSCICAgIOKUgiAgbW92ICAgICB4MSwgeDAKICAgICAgIOKU
giAgICDilIIgIG1vdiAgICAgeDAsIHgyNwogICAgICAg4pSCICAgIOKUguKGkiBibCAgICAgc3Rt
bWFjX2ZpbmFsaXplX3hkcF9yeAogICAgICAg4pSCNmNjOuKUlOKUgOKGkmxkciAgICB4MSwgW3Nw
LCAjMTc2XQoKd2l0aCAnaWYgKHhkcF9zdGF0dXMpJyBzdGF0ZW1lbnQsIGp1bXAgdG8gJzZjYycg
bGFiZWwgaWYgeGRwX3N0YXR1cyBoYXMKemVybyB2YWx1ZS4KClNpZ25lZC1vZmYtYnk6IExlZXNv
byBBaG4gPGxzYWhuQG9vc2VlbC5uZXQ+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvc3RtbWFjX21haW4uYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCmluZGV4IGU0OTAyYTdiYjYxZS4uNTNjNmU5YjNh
MGMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1t
YWNfbWFpbi5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1h
Y19tYWluLmMKQEAgLTUxNDUsNyArNTE0NSw4IEBAIHN0YXRpYyBpbnQgc3RtbWFjX3J4X3pjKHN0
cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiwgaW50IGxpbWl0LCB1MzIgcXVldWUpCiAJCXJ4X3EtPnN0
YXRlLmxlbiA9IGxlbjsKIAl9CiAKLQlzdG1tYWNfZmluYWxpemVfeGRwX3J4KHByaXYsIHhkcF9z
dGF0dXMpOworCWlmICh4ZHBfc3RhdHVzKQorCQlzdG1tYWNfZmluYWxpemVfeGRwX3J4KHByaXYs
IHhkcF9zdGF0dXMpOwogCiAJcHJpdi0+eHN0YXRzLnJ4X3BrdF9uICs9IGNvdW50OwogCXByaXYt
PnhzdGF0cy5yeHFfc3RhdHNbcXVldWVdLnJ4X3BrdF9uICs9IGNvdW50OwpAQCAtNTQyNSw3ICs1
NDI2LDggQEAgc3RhdGljIGludCBzdG1tYWNfcngoc3RydWN0IHN0bW1hY19wcml2ICpwcml2LCBp
bnQgbGltaXQsIHUzMiBxdWV1ZSkKIAkJcnhfcS0+c3RhdGUubGVuID0gbGVuOwogCX0KIAotCXN0
bW1hY19maW5hbGl6ZV94ZHBfcngocHJpdiwgeGRwX3N0YXR1cyk7CisJaWYgKHhkcF9zdGF0dXMp
CisJCXN0bW1hY19maW5hbGl6ZV94ZHBfcngocHJpdiwgeGRwX3N0YXR1cyk7CiAKIAlzdG1tYWNf
cnhfcmVmaWxsKHByaXYsIHF1ZXVlKTsKIAotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
