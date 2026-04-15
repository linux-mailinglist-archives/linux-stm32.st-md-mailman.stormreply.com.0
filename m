Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMC3Ebql32miXAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 16:50:34 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E89640584B
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 16:50:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4AC2C8F286;
	Wed, 15 Apr 2026 14:50:33 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 131E4C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 14:50:32 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488971db0fdso68476825e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776264631; x=1776869431;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jExw1zXy4YyTl+OWBiTmhuXsc+HcqG56ZjMjUPEOfbw=;
 b=CpfZAmWA8o2/tJ4wuQ18QpYbSdfG3JS1Xcf40J2OIDbMYUh073X4iH8NJEWQEuc+zy
 RpW3GR5KIDqY9pONHUsHL+V3tsKALzgXijR72XoB61ReA1eSItbkvf7y3y7cJtQH07rX
 jQJAtR4qqyliLyWFNV9kbZL6x5HjfsGHvDrp90VTRfWPtxvDaMBjygx14dbxKFqncltz
 sBhCNhXzri+3nCgWmVxpGSykctYVLzLHSJSSz/6G6difRV7xk/D3oj2uhFkwGm3nhdjn
 PWNgrVqu8GyH3aKz1kq1b+++E+XXygb7hF+a/0CAQfKR1q6YuWWnAjekurFrOe/dKF5W
 J9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776264631; x=1776869431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jExw1zXy4YyTl+OWBiTmhuXsc+HcqG56ZjMjUPEOfbw=;
 b=X/80/uWTaSWwDTxIfoVup19yIHA/urBoqSjoQdTcg0D59FdRxEY6CgWam630LFAphC
 vjWbZlv5KCkEIUWDEAo9DgeTX0wjOFN7k4fczKUUT42Z5mSOxunqsF9Mu6fA1us87S5O
 WJ3/UqY0rE0YoFET2B8fYhAk6Zm5jF9nc8PFB9K3Gp/UXgYp78cDhmriSZFPQc893WCe
 QNjUXw/7sx1j9Btg/wYd2nH31WSo4DRq9ZLZpkSY7C/nsk2SuoOjAMsz2P14FWI7ygIc
 uYObPWOvYY+Y9CSVsS9zXR9j9zb5Wjk3sYehtB8pahgX92ktXv15uVOsIgUrWd0wv4lj
 KFUQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ94c1MCW9FOFawwfo3z0My2+7olLF9jKOloIhthdp6OJ18YkNs39l/1wDAGiZt+mxh6EwV/g9CG+unkKA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzpsoHC6dlBjhNORIUS2mBXq6ULkguPp94JnUvftQ4dXb1Qi+dr
 ltC3krRdeq7rljBDZjJ5JlQvFE5K//0N4IZD1HsEHkKob+5ZKf8mCmEQeKPG9LzsG3M=
X-Gm-Gg: AeBDievhPry6BdCzCCNI5lpWAeojB9HP276C6htNU7J1/Sr2p0wcayqAJaw2XOWm3k7
 D37ZUZ4abG/xl/U+hWb1edroAC05s8numRS9erF0gIuMewMwilVvV7hxrTMdXaS7OWvkTBDMlko
 3VF8uEm4xj4bR6HUv/IcHMVH1DzcD/oyFYbtXqyFJv4IpINGBOTQm+QQg8j/m4DortNsaHDo/b3
 EOri/3Nuay7dpl4xFIoXBxYU9TyT3W0QiwaKJHlnPb6l1YGF37NQG4OvsOxvEubPaEtJBCS7jPv
 nKr/0PnnYFXfQNzkIIEKblPMPA4bBOm3MfkKKx1QdLkziyiCvcz4yy9rbUDW7V0dtBat+46zf8b
 hukhfQmgJn18kas7V3unieqaXkV20whby6JFitgsUTBY9d8QHFE/uEcpBN9il+W3dqQOpvBLzNW
 pWktq5Bf5d+qNJ33IyeVbonacDKgfIOUy99n/i+aPXK8qYQDdv2lOk/2Kafxc9wuyAjIHbLXwGQ
 Jyx4lfn581obDg=
X-Received: by 2002:a05:600c:45cd:b0:488:9ed3:1492 with SMTP id
 5b1f17b1804b1-488d67f0bb7mr285886345e9.10.1776264631425; 
 Wed, 15 Apr 2026 07:50:31 -0700 (PDT)
Received: from localhost
 (p200300f65f20eb084c777289617ec110.dip0.t-ipconnect.de.
 [2003:f6:5f20:eb08:4c77:7289:617e:c110])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-488f08b960esm37537185e9.0.2026.04.15.07.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2026 07:50:31 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 15 Apr 2026 16:50:12 +0200
Message-ID: <c5e7767cee821b5f6e00f95bd14a5e13015646fb.1776264104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776264104.git.u.kleine-koenig@baylibre.com>
References: <cover.1776264104.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3091;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=ajSHpn1BNzonBrH5M8RMYAzp3h9B89S9cIWnNvrv9aY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp36Wn3t8V0cwMk6wJp4ND3V1gfyMohb6DSJJWf
 9cMInW5qk+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCad+lpwAKCRCPgPtYfRL+
 TnNvB/9+W/2Jab6L+30hO6T7u6hyyxLqJfIMDaAjeCbtPY+hhJtBlwYwdwTN0y48ovKKOB6MOpO
 O5U0WpFLZgrfzUQSxFT0Qzabf2FhdR1jacnbk8+dq2kQau/7hplscF/Uzw18UVDVfOXrUEgAkW2
 hax6KpmE81l0DGtEue+aODWW7iyUixYNQJMikXfZvc8tJ+XPotiIuPYqs5nR6+mRq5lbqZBNuPb
 t2SfQNVVfJ0DysXaNEjCOqyWzkHWboL/gJlRnCpiVJOHG0VuCFdLOAjSVSKJi6SS/LRncLflxVP
 nq+Whuh9IrMXT/HlXuDLLjB7as8f+w3U0wuqbHkiTaDI+ymi
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-pwm@vger.kernel.org, Andrea della Porta <andrea.porta@suse.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v1 1/2] pwm: stm32: Fix rounding issue for
	requests with inverted polarity
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:fabrice.gasnier@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-pwm@vger.kernel.org,m:andrea.porta@suse.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,gmail.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.933];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-stm32];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 2E89640584B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VGhlIGNhbGN1bGF0aW9uIG9mIHRoZSBudW1iZXIgb2YgcHdtIGNsayB0aWNrcyBmcm9tIGEgdGlt
ZSBsZW5ndGggaW4KbmFub3NlY29uZHMgaW52b2x2ZXMgYSBkaXZpc2lvbiBhbmQgdGh1cyBzb21l
IHJvdW5kaW5nLiBUaGF0IG1pZ2h0CnJlc3VsdCBpbgoKCWR1dHlfdGlja3MgKyBvZmZzZXRfdGlj
a3MgPCBwZXJpb2RfdGlja3MKCmRlc3BpdGUKCglkdXR5X2xlbmd0aF9ucyArIGR1dHlfb2Zmc2V0
X25zID49IHBlcmlvZF9sZW5ndGhfbnMKCi4gVGhlIHN0bTMyIFBXTSBjYW5ub3QgY29uZmlndXJl
IG9mZnNldF90aWNrcyBmcmVlbHksIGl0IGNhbiBvbmx5IHNlbGVjdAowIG9yIHBlcmlvZF9sZW5n
dGhfbnMgLSBkdXR5X2xlbmd0aF9ucy0tLXRoYXQgaXMgdGhlIGNsYXNzaWMgbm9ybWFsIGFuZApp
bnZlcnRlZCBwb2xhcml0eS4gVGhlIGRlY2lzaW9uIHRvIHNlbGVjdCB0aGUgaGFyZHdhcmUgcG9s
YXJpdHkgbXVzdCBiZQpkb25lIHVzaW5nIHRoZSB0aWNrcyB2YWx1ZXMgYW5kIG5vdCB0aGUgbmFu
b3NlY29uZHMgdGltZXMgdG8gYWRoZXJlIHRvCnRoZSByb3VuZGluZyBydWxlcyBieSB0aGUgcHdt
IGNvcmUuCgpXaXRoIHRoZSBwd20gY2xrIHJ1bm5pbmcgYXQgMjA4OTAwIGtIeiBvbiBteSB0ZXN0
IG1hY2hpbmUKKHN0bTMybXAxMzVmLWRrKSwgYSB0ZXN0IGNhc2UgdGhhdCB3YXMgaGFuZGxlZCB3
cm9uZyBpczoKCgkjIHB3bXJvdW5kIC1QIDk5OTk5NjIgLU8gMjQ5NzAgLUQgOTk3NDk5MgoJcGVy
aW9kX2xlbmd0aCA9IDk5OTk5NjIKCWR1dHlfbGVuZ3RoID0gOTk3NDg0MAoJZHV0eV9vZmZzZXQg
PSAyNTEyMwoKV2l0aCB0aGlzIGNoYW5nZSBhcHBsaWVkIHRoZSByb3VuZGluZyBpcyBkb25lIGNv
cnJlY3RseToKCgkjIHB3bXJvdW5kIC1QIDk5OTk5NjIgLU8gMjQ5NzAgLUQgOTk3NDk5MgoJcGVy
aW9kX2xlbmd0aCA9IDk5OTk5NjIKCWR1dHlfbGVuZ3RoID0gOTk3NDg0MAoJZHV0eV9vZmZzZXQg
PSAwCgpGaXhlczogZGVhYmE5Y2ZmODA5ICgicHdtOiBzdG0zMjogSW1wbGVtZW50YXRpb24gb2Yg
dGhlIHdhdmVmb3JtIGNhbGxiYWNrcyIpClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmln
IDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1zdG0z
Mi5jIHwgMjIgKysrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1z
dG0zMi5jIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKaW5kZXggMjU5NGZiNzcxYjA0Li45MzUy
NTdhODkwYjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCisrKyBiL2RyaXZl
cnMvcHdtL3B3bS1zdG0zMi5jCkBAIC02OCw3ICs2OCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdt
X3JvdW5kX3dhdmVmb3JtX3RvaHcoc3RydWN0IHB3bV9jaGlwICpjaGlwLAogCXN0cnVjdCBzdG0z
Ml9wd20gKnByaXYgPSB0b19zdG0zMl9wd21fZGV2KGNoaXApOwogCXVuc2lnbmVkIGludCBjaCA9
IHB3bS0+aHdwd207CiAJdW5zaWduZWQgbG9uZyByYXRlOwotCXU2NCBjY3IsIGR1dHk7CisJdTY0
IGR1dHlfdGlja3MsIG9mZnNldF90aWNrczsKIAlpbnQgcmV0OwogCiAJaWYgKHdmLT5wZXJpb2Rf
bGVuZ3RoX25zID09IDApIHsKQEAgLTE2NCwyMyArMTY0LDI1IEBAIHN0YXRpYyBpbnQgc3RtMzJf
cHdtX3JvdW5kX3dhdmVmb3JtX3RvaHcoc3RydWN0IHB3bV9jaGlwICpjaGlwLAogCQl3Zmh3LT5h
cnIgPSBtaW5fdCh1NjQsIGFyciwgcHJpdi0+bWF4X2FycikgLSAxOwogCX0KIAotCWR1dHkgPSBt
dWxfdTY0X3U2NF9kaXZfdTY0KHdmLT5kdXR5X2xlbmd0aF9ucywgcmF0ZSwKLQkJCQkgICAodTY0
KU5TRUNfUEVSX1NFQyAqICh3Zmh3LT5wc2MgKyAxKSk7Ci0JZHV0eSA9IG1pbl90KHU2NCwgZHV0
eSwgd2Zody0+YXJyICsgMSk7CisJZHV0eV90aWNrcyA9IG11bF91NjRfdTY0X2Rpdl91NjQod2Yt
PmR1dHlfbGVuZ3RoX25zLCByYXRlLAorCQkJCQkgKHU2NClOU0VDX1BFUl9TRUMgKiAod2Zody0+
cHNjICsgMSkpOworCWR1dHlfdGlja3MgPSBtaW5fdCh1NjQsIGR1dHlfdGlja3MsIHdmaHctPmFy
ciArIDEpOwogCi0JaWYgKHdmLT5kdXR5X2xlbmd0aF9ucyAmJiB3Zi0+ZHV0eV9vZmZzZXRfbnMg
JiYKLQkgICAgd2YtPmR1dHlfbGVuZ3RoX25zICsgd2YtPmR1dHlfb2Zmc2V0X25zID49IHdmLT5w
ZXJpb2RfbGVuZ3RoX25zKSB7CisJb2Zmc2V0X3RpY2tzID0gbXVsX3U2NF91NjRfZGl2X3U2NCh3
Zi0+ZHV0eV9vZmZzZXRfbnMsIHJhdGUsCisJCQkJCSAgICh1NjQpTlNFQ19QRVJfU0VDICogKHdm
aHctPnBzYyArIDEpKTsKKwlvZmZzZXRfdGlja3MgPSBtaW5fdCh1NjQsIG9mZnNldF90aWNrcywg
d2Zody0+YXJyICsgMSk7CisKKwlpZiAoZHV0eV90aWNrcyAmJiBvZmZzZXRfdGlja3MgJiYKKwkg
ICAgZHV0eV90aWNrcyArIG9mZnNldF90aWNrcyA+PSB3Zmh3LT5hcnIgKyAxKSB7CiAJCXdmaHct
PmNjZXIgfD0gVElNX0NDRVJfQ0N4UChjaCArIDEpOwogCQlpZiAocHJpdi0+aGF2ZV9jb21wbGVt
ZW50YXJ5X291dHB1dCkKIAkJCXdmaHctPmNjZXIgfD0gVElNX0NDRVJfQ0N4TlAoY2ggKyAxKTsK
IAotCQljY3IgPSB3Zmh3LT5hcnIgKyAxIC0gZHV0eTsKKwkJd2Zody0+Y2NyID0gd2Zody0+YXJy
ICsgMSAtIGR1dHlfdGlja3M7CiAJfSBlbHNlIHsKLQkJY2NyID0gZHV0eTsKKwkJd2Zody0+Y2Ny
ID0gZHV0eV90aWNrczsKIAl9CiAKLQl3Zmh3LT5jY3IgPSBtaW5fdCh1NjQsIGNjciwgd2Zody0+
YXJyICsgMSk7Ci0KIG91dDoKIAlkZXZfZGJnKCZjaGlwLT5kZXYsICJwd20jJXU6ICVsbGQvJWxs
ZCBbKyVsbGRdIEAlbHUgLT4gQ0NFUjogJTA4eCwgUFNDOiAlMDh4LCBBUlI6ICUwOHgsIENDUjog
JTA4eFxuIiwKIAkJcHdtLT5od3B3bSwgd2YtPmR1dHlfbGVuZ3RoX25zLCB3Zi0+cGVyaW9kX2xl
bmd0aF9ucywgd2YtPmR1dHlfb2Zmc2V0X25zLAotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
