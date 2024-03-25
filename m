Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F297C88946D
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Mar 2024 08:56:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5CBBC6B444;
	Mon, 25 Mar 2024 07:56:45 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16233C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Mar 2024 07:56:45 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a4a393b699fso60613866b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Mar 2024 00:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711353404; x=1711958204;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a89LEVm7xD3V3aipTuTByCc7qaD6TInwfvfX/3rmr3k=;
 b=UtDibnbxXYfLgJ6J8FZ79vY4/Xl3nmEUOH1WKB2qvZEsGjktbI7Op0/E0F4VVCVHt0
 PH9Q1aznpSHdufWwllETvEKZxZQHgjclGoVUh6YvY2hWaurYV7ftjMaw4NAVnAiA2mG+
 oLKIhMns2QG8WTWJSiSFYxuGzJzUOQUOYBbPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711353404; x=1711958204;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a89LEVm7xD3V3aipTuTByCc7qaD6TInwfvfX/3rmr3k=;
 b=o4FyRsL4w+2yaAEJrt9rpPfzKLnIxuDGbP7I0hg9cNR9RwFiUQzFp4OagagMs7i2pt
 FkC7P+vMS6ZIe/Ncmjz3zERUXhL4dwOvzi9XRuhADQFKQ0wP+uoUgOK0MtA+YxsdRZaf
 uGl0poOfU0T+qrGPOaMSDry3cAUBLu9vK08aeGCdiO+PnP4/k29AwAazC62fd7MZd8R2
 QDlqR2EqHrss+EZJiMKz4UZsiXCQM3YiGfCXUaG2zKVu69HjOUmC65nzLRV8HgY0NAtx
 17Uu14jmVLP+Zr5yZ50aIVlGFzF2HlF8kOUMzzRoCV09CHSdnJUhFqtLpU/j5J66xEC9
 j5tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQddeQdPgHJv2ObE7+Aexyz7Amm5Eqj7qzwqujWoYf/9NzKAO95EuE91zo/kGEl/f176iWw14Iiw3UJMibORnbAX7NYjVN5L0Seijn4ke7XEtjceq2+hB/
X-Gm-Message-State: AOJu0Yzo9qLVMGhxfAQN7T+RroF3ULA6CHTAel92OlSyW8R7Zt0bOMl0
 N4orXIWkiVBfYjroYkPd8Oy1nB+yY3FTuYhwWOdDqh5Dpehfq5aChTehctNGvqs=
X-Google-Smtp-Source: AGHT+IEeee43tChvxvBZH14MFQxubrof2GweXWpHdJI4TLqNPXlTq1m6/KkDZ6ZtyycHFcrYpdLjtg==
X-Received: by 2002:a17:906:b786:b0:a47:4145:3598 with SMTP id
 dt6-20020a170906b78600b00a4741453598mr4172639ejb.20.1711353404443; 
 Mon, 25 Mar 2024 00:56:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 lb13-20020a170906adcd00b00a4750131edasm1661001ejb.206.2024.03.25.00.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 00:56:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 25 Mar 2024 08:56:28 +0100
Message-ID: <20240325075635.1382911-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: move can3 node from
	stm32f746 to stm32f769
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

QWNjb3JkaW5nIHRvIGRvY3VtZW50cyBbMV0sIFsyXSBhbmQgWzNdLCB3ZSBoYXZlIDIgQ0FOIGRl
dmljZXMgb24gdGhlCnN0bTMyZjc0NiBwbGF0Zm9ybSBhbmQgMyBvbiB0aGUgc3RtMzJmNzY5IHBs
YXRmb3JtLiBTbyBsZXQncyBtb3ZlIHRoZQpjYW4zIG5vZGUgZnJvbSBzdG0zMmY3NDYuZHRzaSB0
byBzdG0zMmY3NjkuZHRzaS4KClsxXSBodHRwczovL3d3dy5zdC5jb20vZW4vbWljcm9jb250cm9s
bGVycy1taWNyb3Byb2Nlc3NvcnMvc3RtMzJmNy1zZXJpZXMuaHRtbApbMl0gUk0wMzg1OiBTVE0z
MkY3NXh4eCBhbmQgU1RNMzJGNzR4eHggYWR2YW5jZWQgQXJtwq4tYmFzZWQgMzItYml0IE1DVXMK
WzNdIFJNMDQxMDogU1RNMzJGNzZ4eHggYW5kIFNUTTMyRjc3eHh4IGFkdmFuY2VkIEFybcKuLWJh
c2VkIDMyLWJpdCBNQ1VzCkZpeGVzOiBkZjM2MjkxNGVlYWQgKCJBUk06IGR0czogc3RtMzI6IHJl
LWFkZCBDQU4gc3VwcG9ydCBvbiBzdG0zMmY3NDYiKQpTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5h
Y2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CgotLS0KCiBhcmNoL2Fy
bS9ib290L2R0cy9zdC9zdG0zMmY3NDYuZHRzaSB8IDE3IC0tLS0tLS0tLS0tLS0tLS0tCiBhcmNo
L2FybS9ib290L2R0cy9zdC9zdG0zMmY3NjkuZHRzaSB8IDE3ICsrKysrKysrKysrKysrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc0Ni5kdHNpIGIvYXJjaC9hcm0vYm9v
dC9kdHMvc3Qvc3RtMzJmNzQ2LmR0c2kKaW5kZXggNjVjNzJiNmZjYzgzLi4yNTM3YjNkNDdlNmYg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc0Ni5kdHNpCisrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc0Ni5kdHNpCkBAIC0yNTcsMjMgKzI1Nyw2IEBAIHJ0
YzogcnRjQDQwMDAyODAwIHsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CiAKLQkJY2Fu
MzogY2FuQDQwMDAzNDAwIHsKLQkJCWNvbXBhdGlibGUgPSAic3Qsc3RtMzJmNC1ieGNhbiI7Ci0J
CQlyZWcgPSA8MHg0MDAwMzQwMCAweDIwMD47Ci0JCQlpbnRlcnJ1cHRzID0gPDEwND4sIDwxMDU+
LCA8MTA2PiwgPDEwNz47Ci0JCQlpbnRlcnJ1cHQtbmFtZXMgPSAidHgiLCAicngwIiwgInJ4MSIs
ICJzY2UiOwotCQkJcmVzZXRzID0gPCZyY2MgU1RNMzJGN19BUEIxX1JFU0VUKENBTjMpPjsKLQkJ
CWNsb2NrcyA9IDwmcmNjIDAgU1RNMzJGN19BUEIxX0NMT0NLKENBTjMpPjsKLQkJCXN0LGdjYW4g
PSA8JmdjYW4zPjsKLQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Ci0JCX07Ci0KLQkJZ2NhbjM6IGdj
YW5ANDAwMDM2MDAgewotCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMmY0LWdjYW4iLCAic3lzY29u
IjsKLQkJCXJlZyA9IDwweDQwMDAzNjAwIDB4MjAwPjsKLQkJCWNsb2NrcyA9IDwmcmNjIDAgU1RN
MzJGN19BUEIxX0NMT0NLKENBTjMpPjsKLQkJfTsKLQogCQlzcGkyOiBzcGlANDAwMDM4MDAgewog
CQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAJCQkjc2l6ZS1jZWxscyA9IDwwPjsKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc2OS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9k
dHMvc3Qvc3RtMzJmNzY5LmR0c2kKaW5kZXggNGU3ZDkwMzIxNDljLi5lOGNiYjk5ZTgxYTYgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc2OS5kdHNpCisrKyBiL2FyY2gv
YXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc2OS5kdHNpCkBAIC03LDYgKzcsMjMgQEAKIAogLyB7CiAJ
c29jIHsKKwkJY2FuMzogY2FuQDQwMDAzNDAwIHsKKwkJCWNvbXBhdGlibGUgPSAic3Qsc3RtMzJm
NC1ieGNhbiI7CisJCQlyZWcgPSA8MHg0MDAwMzQwMCAweDIwMD47CisJCQlpbnRlcnJ1cHRzID0g
PDEwND4sIDwxMDU+LCA8MTA2PiwgPDEwNz47CisJCQlpbnRlcnJ1cHQtbmFtZXMgPSAidHgiLCAi
cngwIiwgInJ4MSIsICJzY2UiOworCQkJcmVzZXRzID0gPCZyY2MgU1RNMzJGN19BUEIxX1JFU0VU
KENBTjMpPjsKKwkJCWNsb2NrcyA9IDwmcmNjIDAgU1RNMzJGN19BUEIxX0NMT0NLKENBTjMpPjsK
KwkJCXN0LGdjYW4gPSA8JmdjYW4zPjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07CisK
KwkJZ2NhbjM6IGdjYW5ANDAwMDM2MDAgeworCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMmY0LWdj
YW4iLCAic3lzY29uIjsKKwkJCXJlZyA9IDwweDQwMDAzNjAwIDB4MjAwPjsKKwkJCWNsb2NrcyA9
IDwmcmNjIDAgU1RNMzJGN19BUEIxX0NMT0NLKENBTjMpPjsKKwkJfTsKKwogCQlkc2k6IGRzaUA0
MDAxNmMwMCB7CiAJCQljb21wYXRpYmxlID0gInN0LHN0bTMyLWRzaSI7CiAJCQlyZWcgPSA8MHg0
MDAxNmMwMCAweDgwMD47Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
