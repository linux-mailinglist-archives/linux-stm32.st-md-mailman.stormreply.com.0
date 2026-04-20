Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJN9GMOQ5mlWyQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2026 22:46:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDACF433CC1
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2026 22:46:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84635C57B68;
	Mon, 20 Apr 2026 20:46:58 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BB13C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 20:46:57 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488ad135063so28370755e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 13:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776718017; x=1777322817;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VMggFWx7dYASz3kXTlVBRyuVlZg3W3BNVcMSDh8xWWQ=;
 b=g5hyxM7o4PElnWrkQkujhVk5UujcYVEnX0EM9WM+UDxs37gKh19kUwNd8gNkPkSM4A
 8N3x3WEP66LZjshF3lpbc8RXilmjuI8n9WVvXffCPMItSPrfaC8168R+cfANkKJ9OoVF
 FxWg0o7LLsCOO23Gnywc1Ca22RPXeHzrzwo2i4tx4tL4kG15JDxWySRHqdeA5g3YWEEN
 YHurncnOcGNI72+IRbTz2a3x7eb+MLVo76EpWXRw/OFIf//QHQtRdKPrU+L+Gt7KOg5l
 vxrQX17/AUq4SlaaXnFng0R843BwL+g/Yv4oi2UZQqsBadDNchCGWzoyRyVRkSl0+B/A
 rNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776718017; x=1777322817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VMggFWx7dYASz3kXTlVBRyuVlZg3W3BNVcMSDh8xWWQ=;
 b=sSsa9XirGOimwU4Dn3V8wltluzscJv42ij5jbCx88QPnTNtUyCoZJBUuN//A24YJBO
 8kIsWo8U/DLJlbu5nFxWR88FWqEzkRoE3fsiSLKpOQfYt0/HWbfQsutw+FxyPnn1syhP
 +ubYUKJhZQz8aV80HM5Ak36orutu77pPGCmJwgGCKzQT3CYZAPNMKfj5+AAWQ5+J3C+R
 9nEA26iO+V1UQSbYthJl8lgIRE1XmoJ3Q3hVY7PuRnviW9yB3AmSh7O+DobOeiZttfFW
 3DYexiHfEA/8n8MLUSZoHv1S/DxKENxrQMDy+Uunkh7d73G8c1iuh65qJwhKO7E/8nAp
 l+rQ==
X-Gm-Message-State: AOJu0Yy2N6ogdvr28y57zCcy8nVIEvAVMgnyZUrQDx4P8w/I7qpFBb+p
 JQSBqGOFLHK1sd/WssfOBy7Y0/t9Zts58TnW2+YOYBGqjkDGeZr3yXqfpXjEA1F3+3c=
X-Gm-Gg: AeBDieuuYJKcNTN7+ubNSi0M/JgojYKHcPpubdy6u4+Cv7v2gUcwqnAloUoxN0WmvLD
 88oKABlJOtWdH3SwDZO92kYwQneJAzqkrRzgrTyFBRjygGcCCyppdJm1m9r0n2a8ogFuJTXScN/
 S5/GBJ9tS7cDnCfvDXwCPcKxuIriRkvybVkxsEmXHLoJ3+4rCaumQh+51O9AHWvMAxKkxoYz/DU
 rqa0Fn5lHBaSE8cAAbxWO9RNgs61ZOENcrOB7lAxXLfJXDZgreXPXXE5kTeocMi57SARCpBTlI+
 4xI11u1CAB+iNCBMnts/LhuYsFrVeSJez1jCWgDnQgR2D1gBQtAcfAmBtlPFIMakZI1Jmo+FY+c
 6J7FrFuZC7xGWmOWPtDi4cqCaGlQZdp5fIJGAUkNOBRdYr9TMSQFiqbDPtC0MdWd3eEaxXJM5A7
 0Ym7pRSZJrDq39qeMZcs3GFYeOu0FbENfzMQKgEmw=
X-Received: by 2002:a05:600c:41d6:b0:487:2439:b7c8 with SMTP id
 5b1f17b1804b1-488fb745294mr139309655e9.1.1776718016447; 
 Mon, 20 Apr 2026 13:46:56 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-48a525a0b1asm26426845e9.2.2026.04.20.13.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 13:46:55 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 20 Apr 2026 22:46:48 +0200
Message-ID: <20260420204647.1713944-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4578;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=RuUj00JzNu8fU+LKSjapTZ5tePNXtbbVLDbLqJadgE0=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhsxnE7afuh0buGxPjI7/qzX+rqKPpj79HJb5uuiWmMZdX
 7P1lmvmdTIaszAwcjHIiimy2DeuybSqkovsXPvvMswgViaQKQxcnAIwkTx99n+6i9ZIv9BUz/aI
 WMaosdxeYc2bGcskUhr3fBdjMW4O0orRejynQN+oQXx+m/3SD5q6bJdZZd3EhIOb3+z4tX2lDe+
 fu5FdkVxF9hwXtxc7Jc3W9TqtettxUtNNy3s7uZmW1LZk75oSf/b/75XVtvVV3ZcO//RukY1s9p
 o5+V7jI0GeTZdZl3q1msd+f/IiunXms+aF4Q5v3WaFZFbyxLZ4uz6uLmT2WhjuXDP53IKd09q5Z
 88Kaw97dynWnaNEqcZfot5548OJqiv/bhJdE1/TbiS3/dOF+d/5Ip+cni6SemDqKtFte5sbWFKb
 lsQ0dmm0a9ooF1TItVo4JwfMW6a6IH7zzfjsow6Zuat7AA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] ARM: dts: stm32: add board pin
	documentation stm32mp135f-dk
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
X-Spamd-Result: default: False [8.19 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[baylibre.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.13:email,0.0.0.1:email,0.0.0.0:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	R_SPF_ALLOW(0.00)[+ip4:52.209.6.89];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_SPAM(0.00)[0.888];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,baylibre.com:mid,baylibre.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: DDACF433CC1
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

UmVsYXRlIHRoZSBkZXZpY2VzIGRlZmluZWQgaW4gdGhlIGRldmljZSB0cmVlIHRvIHRoZSBTb0Mg
cG9ydHMgYW5kIHBpbnMKYW5kIGxhYmVscyBhdmFpbGFibGUgb24gdGhlIGJvYXJkLgoKU2lnbmVk
LW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+
Ci0tLQpIZWxsbywKCm15IChpbXBsaWNpdCkgdjEgd2FzIHJldmlld2VkIGJ5IHNhc2hpa28sIHNl
ZQpodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA0MTYxMTAyMTguNTk0OTExLTIt
dS5rbGVpbmUta29lbmlnJTQwYmF5bGlicmUuY29tCgpUaGUgZmluZGluZ3Mgd2VyZSBnb29kLCB0
aGlzIHYyIGFkZHJlc3NlcyB0aGVzZS4KCkJlc3QgcmVnYXJkcwpVd2UKCiBhcmNoL2FybS9ib290
L2R0cy9zdC9zdG0zMm1wMTM1Zi1kay5kdHMgfCAyOCArKysrKysrKysrKysrKysrKysrKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1kay5kdHMgYi9hcmNoL2Fy
bS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1kay5kdHMKaW5kZXggOGRjZjY4YjIxMmI0Li5mZmFj
M2M0ZmQ2MDggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRr
LmR0cworKysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1kay5kdHMKQEAgLTY0
LDYgKzY0LDcgQEAgZ3Bpby1rZXlzIHsKIAkJY29tcGF0aWJsZSA9ICJncGlvLWtleXMiOwogCiAJ
CWJ1dHRvbi11c2VyIHsKKwkJCS8qIEdQSU8gb24gUEExMyAiVXNlciBidXR0b24gMiAoQjIpIiAq
LwogCQkJbGFiZWwgPSAiVXNlci1QQTEzIjsKIAkJCWxpbnV4LGNvZGUgPSA8QlROXzE+OwogCQkJ
Z3Bpb3MgPSA8JmdwaW9hIDEzIChHUElPX0FDVElWRV9MT1cgfCBHUElPX1BVTExfVVApPjsKQEAg
LTc0LDYgKzc1LDcgQEAgbGVkcyB7CiAJCWNvbXBhdGlibGUgPSAiZ3Bpby1sZWRzIjsKIAogCQls
ZWRfYmx1ZTogbGVkLWJsdWUgeworCQkJLyogR1BJTyBvbiBQQTE0ICJVc2VyIExFRCAoTEQzKSIg
Ki8KIAkJCWZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX0hFQVJUQkVBVDsKIAkJCWNvbG9yID0gPExF
RF9DT0xPUl9JRF9CTFVFPjsKIAkJCWdwaW9zID0gPCZncGlvYSAxNCBHUElPX0FDVElWRV9MT1c+
OwpAQCAtODIsNiArODQsNyBAQCBsZWRfYmx1ZTogbGVkLWJsdWUgewogCQl9OwogCiAJCWxlZC1y
ZWQgeworCQkJLyogR1BJTyBvbiBQQTEzICJVc2VyIExFRCAoTEQ0KSIgKi8KIAkJCWZ1bmN0aW9u
ID0gTEVEX0ZVTkNUSU9OX1NUQVRVUzsKIAkJCWNvbG9yID0gPExFRF9DT0xPUl9JRF9SRUQ+Owog
CQkJZ3Bpb3MgPSA8JmdwaW9hIDEzIEdQSU9fQUNUSVZFX0xPVz47CkBAIC0yMjgsNiArMjMxLDcg
QEAgcGh5MF9ldGgxOiBldGhlcm5ldC1waHlAMCB7CiAKICZpMmMxIHsKIAlwaW5jdHJsLW5hbWVz
ID0gImRlZmF1bHQiLCAic2xlZXAiOworCS8qIFNEQSBvbiBQRTggPSBDTjguMjcsIFNDTCBvbiBQ
RDEyID0gQ044LjI4ICovCiAJcGluY3RybC0wID0gPCZpMmMxX3BpbnNfYT47CiAJcGluY3RybC0x
ID0gPCZpMmMxX3NsZWVwX3BpbnNfYT47CiAJaTJjLXNjbC1yaXNpbmctdGltZS1ucyA9IDw5Nj47
CkBAIC00NjIsNyArNDY2LDEwIEBAIGNvdW50ZXIgewogCQlzdGF0dXMgPSAib2theSI7CiAJfTsK
IAlwd20gewotCQkvKiBQV00gb3V0cHV0IG9uIHBpbiA3IG9mIHRoZSBleHBhbnNpb24gY29ubmVj
dG9yIChDTjguNykgdXNpbmcgVElNM19DSDQgZnVuYyAqLworCQkvKgorCQkgKiBDSDQgb24gUEIx
ID0gQ044Ljc7CisJCSAqIENIMyBvbiBQQjAgPSBDTjguMTAgaXMgcG9zc2libGUgKGNvbmZsaWN0
aW5nIHdpdGggdXNhcnQxKQorCQkgKi8KIAkJcGluY3RybC0wID0gPCZwd20zX3BpbnNfYT47CiAJ
CXBpbmN0cmwtMSA9IDwmcHdtM19zbGVlcF9waW5zX2E+OwogCQlwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiLCAic2xlZXAiOwpAQCAtNDgxLDcgKzQ4OCwxMCBAQCBjb3VudGVyIHsKIAkJc3RhdHVz
ID0gIm9rYXkiOwogCX07CiAJcHdtIHsKLQkJLyogUFdNIG91dHB1dCBvbiBwaW4gMzEgb2YgdGhl
IGV4cGFuc2lvbiBjb25uZWN0b3IgKENOOC4zMSkgdXNpbmcgVElNNF9DSDIgZnVuYyAqLworCQkv
KgorCQkgKiBDSDIgb24gUEQxMyA9IENOOC4zMTsKKwkJICogQ0gxIG9uIFBEMTIgPSBDTjguMjgg
aXMgcG9zc2libGUgKGNvbmZsaWN0aW5nIHdpdGggJmkyYzEpCisJCSAqLwogCQlwaW5jdHJsLTAg
PSA8JnB3bTRfcGluc19hPjsKIAkJcGluY3RybC0xID0gPCZwd200X3NsZWVwX3BpbnNfYT47CiAJ
CXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCI7CkBAIC01MDAsNyArNTEwLDEyIEBA
IGNvdW50ZXIgewogCQlzdGF0dXMgPSAib2theSI7CiAJfTsKIAlwd20gewotCQkvKiBQV00gb3V0
cHV0IG9uIHBpbiAzMiBvZiB0aGUgZXhwYW5zaW9uIGNvbm5lY3RvciAoQ044LjMyKSB1c2luZyBU
SU04X0NIMyBmdW5jICovCisJCS8qCisJCSAqIENIMyBvbiBQRTUgPSBDTjguMzIKKwkJICogQ0gx
TiBvbiBQQTcgPSBDTjguMzYgaXMgcG9zc2libGUgKGNvbmZsaWN0aW5nIHdpdGggJnVzYXJ0MSkK
KwkJICogQ0gyTiBvbiBQQjAgPSBDTjguMTAgaXMgcG9zc2libGUgKGNvbmZsaWN0aW5nIHdpdGgg
JnVzYXJ0MSkKKwkJICogQ0gzTiBvbiBQQjEgPSBDTjguNyBpcyBwb3NzaWJsZSAoY29uZmxpY3Rp
bmcgd2l0aCAmdGltZXJzMykKKwkJICovCiAJCXBpbmN0cmwtMCA9IDwmcHdtOF9waW5zX2E+Owog
CQlwaW5jdHJsLTEgPSA8JnB3bThfc2xlZXBfcGluc19hPjsKIAkJcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IiwgInNsZWVwIjsKQEAgLTUxNyw3ICs1MzIsNyBAQCBjb3VudGVyIHsKIAkJc3RhdHVz
ID0gIm9rYXkiOwogCX07CiAJcHdtIHsKLQkJLyogUFdNIG91dHB1dCBvbiBwaW4gMzMgb2YgdGhl
IGV4cGFuc2lvbiBjb25uZWN0b3IgKENOOC4zMykgdXNpbmcgVElNMTRfQ0gxIGZ1bmMgKi8KKwkJ
LyogQ0gxIG9uIFBGOSA9IENOOC4zMyAoYWx0ZXJuYXRpdmVseSBvbiBQQTcgPSBDTjguMzYgKGNv
bmZsaWN0aW5nIHdpdGggJnVzYXJ0MSkpICovCiAJCXBpbmN0cmwtMCA9IDwmcHdtMTRfcGluc19h
PjsKIAkJcGluY3RybC0xID0gPCZwd20xNF9zbGVlcF9waW5zX2E+OwogCQlwaW5jdHJsLW5hbWVz
ID0gImRlZmF1bHQiLCAic2xlZXAiOwpAQCAtNTI5LDYgKzU0NCw3IEBAIHRpbWVyQDEzIHsKIH07
CiAKICZ1YXJ0NCB7CisJLyogQWNjZXNzaWJsZSB2aWEgbWljcm8gVVNCIFNULUxJTksgVVNCIChD
TjEwKSAqLwogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCIsICJpZGxlIjsKIAlw
aW5jdHJsLTAgPSA8JnVhcnQ0X3BpbnNfYT47CiAJcGluY3RybC0xID0gPCZ1YXJ0NF9zbGVlcF9w
aW5zX2E+OwpAQCAtNTQwLDYgKzU1Niw3IEBAICZ1YXJ0NCB7CiAKICZ1YXJ0OCB7CiAJcGluY3Ry
bC1uYW1lcyA9ICJkZWZhdWx0IiwgInNsZWVwIiwgImlkbGUiOworCS8qIFRYIG9uIFBFMSA9IENO
OC4zNywgUlggb24gUEY5ID0gQ044LjMzICovCiAJcGluY3RybC0wID0gPCZ1YXJ0OF9waW5zX2E+
OwogCXBpbmN0cmwtMSA9IDwmdWFydDhfc2xlZXBfcGluc19hPjsKIAlwaW5jdHJsLTIgPSA8JnVh
cnQ4X2lkbGVfcGluc19hPjsKQEAgLTU1MCw2ICs1NjcsNyBAQCAmdWFydDggewogCiAmdXNhcnQx
IHsKIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAic2xlZXAiLCAiaWRsZSI7CisJLyogVFgg
b24gUEMwID0gQ044LjgsIFJYIG9uIFBCMCA9IENOOC4xMCwgUlRTIG9uIFBDMiA9IENOOC4xMSwg
Q1RTIG9uIFBBNyA9IENOOC4zNiAqLwogCXBpbmN0cmwtMCA9IDwmdXNhcnQxX3BpbnNfYT47CiAJ
cGluY3RybC0xID0gPCZ1c2FydDFfc2xlZXBfcGluc19hPjsKIAlwaW5jdHJsLTIgPSA8JnVzYXJ0
MV9pZGxlX3BpbnNfYT47CkBAIC01NjAsNiArNTc4LDcgQEAgJnVzYXJ0MSB7CiAvKiBCbHVldG9v
dGggKi8KICZ1c2FydDIgewogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCIsICJp
ZGxlIjsKKwkvKiBUWCBvbiBQSDEyLCBSWCBvbiBQRDE1LCBSVFMgb24gUEQ0LCBDVFMgb24gUEUx
MSAqLwogCXBpbmN0cmwtMCA9IDwmdXNhcnQyX3BpbnNfYT47CiAJcGluY3RybC0xID0gPCZ1c2Fy
dDJfc2xlZXBfcGluc19hPjsKIAlwaW5jdHJsLTIgPSA8JnVzYXJ0Ml9pZGxlX3BpbnNfYT47CkBA
IC01ODksNiArNjA4LDcgQEAgaHViQDEgewogfTsKIAogJnVzYm90Z19ocyB7CisJLyogVVNCIFR5
cGUtQyBEUlAgKENONykgKi8KIAlwaHlzID0gPCZ1c2JwaHljX3BvcnQxIDA+OwogCXBoeS1uYW1l
cyA9ICJ1c2IyLXBoeSI7CiAJdXNiLXJvbGUtc3dpdGNoOwoKYmFzZS1jb21taXQ6IDM2NWFmMWI1
OTIzMzUxYzU5NTE3YTc5ZDE0ZDBiNDU0M2I3OWNlM2IKLS0gCjIuNDcuMwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
