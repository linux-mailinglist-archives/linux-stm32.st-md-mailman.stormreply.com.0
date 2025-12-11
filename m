Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAC4CB6A2C
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Dec 2025 18:16:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36056C5F1FF;
	Thu, 11 Dec 2025 17:16:04 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0510DC3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Dec 2025 17:16:03 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so3562865e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Dec 2025 09:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765473362; x=1766078162;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5a4wMDZK2ViUHeY8ITMBosr5lNb7hmzarN7W0g0+DF8=;
 b=E25f0vi0nKMiwbySL3SmhNH96hO+cYFQS1ziZL81BP6RkStBlNrpV55RVyFcMsx4vF
 wwJBeYfaJ3u9vm7M7irNnaA7TQvhM+hDefPQHNkoZuj2nduWESbkQmLET4rHILCpEha9
 xBSANzeGuqKQnjGfJ5HZQgAa6QZSeOyFpJR5D3uL0qaH19U7ri/9G86UciY3YQsQU3tA
 zS/4yvHSDh84EqxEidtuMr9R2aovV0yqStK42x01/GMZrdyyCpzNk5vqnSdbwT/8i/25
 DSQBxjoZdi12wldsHXlzXJ5rvfjkt7jVCWWiinED+/AWeUYwTW0tBpeqQd76hGEVnanJ
 4KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765473362; x=1766078162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5a4wMDZK2ViUHeY8ITMBosr5lNb7hmzarN7W0g0+DF8=;
 b=N/r2h9ZClV80mQHVXKDVKJqI3Ni4gWJUsOvABKT/nCt/qnYYymgP8PXg73OPNNmHKc
 B/Clq6i+10qzXaWP6cztzLuUKaL7hvun4ePJmbTTe/aPf451zpjGoEnO2UMclhvT5yav
 yJ2eFmBP1ujH06+ZHF/9cZaMloP/+U2PrNKoietGcwXgOJvSXuyTg53fZoxX/XaDiUR/
 P+THYwGlFrydGSgIJoisc5N6Y6I/9M9+NEEQY20/kf7BwfxfyFycr+qK3F/qIpAOSTLW
 PBc35fpl7P7+qk+VNdb5ZuQvLwYmdanL+uLufuK4Blv8Tl5O70eN8GWdTvtFLl4sy5Cr
 qD/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaXa4BnfSFjPZPWUBHRNz5o5fi1XRpef5uBVUdfhoWeLjWosHfG1TTT6czZ99o/f3f9A+E9EakZG4Gqg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx1nc7y1g3V2xZYSWTGAv6jx9fGd7AYV0pR+uFfrx0BP9hOWxB+
 J5dikdxg3QtuaNEpJ0oyeA0GRLGLud988nurFPD4siUe1c2CahytVSrBpquGGbCm30w=
X-Gm-Gg: AY/fxX7RSB02opvLgxTc121PDr0t0EnFP9ue6pVtvAiKo59YdxGhA3DCuUtgXqpn4Ja
 QpHgSI2h3l4KrYSMhYyLccq5piTSx52JPbs5XEDqYRaYLskGSktRfebbH8BZs7oKS6gx7v1vJbZ
 eWwZFMv5O6Z6lj5C8ocf0YdlEivNbeHVtjHVanA0fckEWLxX0FcGRcHiaSWMW5ntEjyxjuZHExr
 eQxvECUnzAnmONSOWQJvrwQsu19oNS0ByD/YHLB8VdFhXArLvlRYHOYCRSIitZ5UkOLht40N0G4
 5TIZJWhUElsARRtU7525QTPZgn4ijfbJHZhzr1eZHD+ZKUUTL97ea2AoF/MN74NOmzNkFONwoIW
 vCIrAHPgZDK5Eb8v/10wT8klhbF7Tjldbq5yijnt53MKtetUX+HVEF7driUlJeB4Ue56hqMu/ox
 i5vwCFUDzVteXZI4HVzq0LWDVBFqA8T1igHpFVdnoNqulR1/9cHO9Rux+XlXW+BgBSDn/qZqhWO
 gw=
X-Google-Smtp-Source: AGHT+IE+X9wMDaoG4Q+goEXvBdmDRMpx3iuUbrVTqUSpfRdjag7tAC9TsJa1xQ5gBIFCyk9gG0Z+Bw==
X-Received: by 2002:a05:600c:4705:b0:477:7925:f7fb with SMTP id
 5b1f17b1804b1-47a8377b8bemr79943275e9.10.1765473362428; 
 Thu, 11 Dec 2025 09:16:02 -0800 (PST)
Received: from localhost
 (p200300f65f006608b66517f2bd017279.dip0.t-ipconnect.de.
 [2003:f6:5f00:6608:b665:17f2:bd01:7279])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-47a8be549d0sm37688665e9.1.2025.12.11.09.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 09:16:02 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jan Kiszka <jan.kiszka@siemens.com>
Date: Thu, 11 Dec 2025 18:15:02 +0100
Message-ID: <0896270bc530d1e3b7fbcf5f7e168172dcc05d1e.1765472125.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=kVl/h/+w7Wr0R904x5vNxSBa3qE7VLiGeImjLkLbd5E=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhkyrPxrp7FaL9OXe8ilvWtXDYnnXyuCubaF9/dc/qQ+s2
 AX+fO/tZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiS5TY/+dkhfWruk/vtTP0
 cL2huff2Oa1DFz4+fvn+Z02QTsTZFcapRusUt3/LZol+FL1N4tx5WUnjj0vO9YtIlius3v/mkau
 lmEV/hrqgQ5Bo9+Z7c/u0D25JeHz1OU9of+bCC5nxDBrThLKXqna/lbZUSpX+yui1/4fwgVXZpg
 Vy73eFanE1iS53SWH2/Xa2N0e57UTUw1naEuIVizpdPt++cObS6W8dZyOy/66SXC7sfGmugYKp0
 zdbqaeB3W3zTn2K/Z5UGl1h4r6npf6chcnpkA1NKuf+rPvXYhTp+7Q5N+XH7YzNOYd8rGv0i3Pz
 Fj5qvefCb/9NnHHpBEeFpB98fzf/7Jqp5mXXdlSnzIgPAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-efi@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v1 08/17] efi: stmm: Make use of
	module_tee_client_driver()
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

UmVkdWNlIGJvaWxlcnBsYXRlIGJ5IHVzaW5nIHRoZSBuZXdseSBpbnRyb2R1Y2VkIG1vZHVsZV90
ZWVfY2xpZW50X2RyaXZlcigpLgpUaGF0IHRha2VzIGNhcmUgb2YgYXNzaWduaW5nIHRoZSBkcml2
ZXIncyBidXMsIHNvIHRoZSBleHBsaWNpdCBhc3NpZ25pbmcKaW4gdGhpcyBkcml2ZXIgY2FuIGJl
IGRyb3BwZWQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29l
bmlnQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2Zpcm13YXJlL2VmaS9zdG1tL3RlZV9zdG1t
X2VmaS5jIHwgMTQgKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9lZmkvc3Rt
bS90ZWVfc3RtbV9lZmkuYyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL3N0bW0vdGVlX3N0bW1fZWZp
LmMKaW5kZXggNjVjMGZlMWJhMjc1Li41OTAzODExODU4YjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
ZmlybXdhcmUvZWZpL3N0bW0vdGVlX3N0bW1fZWZpLmMKKysrIGIvZHJpdmVycy9maXJtd2FyZS9l
Zmkvc3RtbS90ZWVfc3RtbV9lZmkuYwpAQCAtNTg0LDI0ICs1ODQsMTIgQEAgc3RhdGljIHN0cnVj
dCB0ZWVfY2xpZW50X2RyaXZlciB0ZWVfc3RtbV9lZmlfZHJpdmVyID0gewogCS5pZF90YWJsZQk9
IHRlZV9zdG1tX2VmaV9pZF90YWJsZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUJCT0gInRlZS1z
dG1tLWVmaSIsCi0JCS5idXMJCT0gJnRlZV9idXNfdHlwZSwKIAkJLnByb2JlCQk9IHRlZV9zdG1t
X2VmaV9wcm9iZSwKIAkJLnJlbW92ZQkJPSB0ZWVfc3RtbV9lZmlfcmVtb3ZlLAogCX0sCiB9Owog
Ci1zdGF0aWMgaW50IF9faW5pdCB0ZWVfc3RtbV9lZmlfbW9kX2luaXQodm9pZCkKLXsKLQlyZXR1
cm4gZHJpdmVyX3JlZ2lzdGVyKCZ0ZWVfc3RtbV9lZmlfZHJpdmVyLmRyaXZlcik7Ci19Ci0KLXN0
YXRpYyB2b2lkIF9fZXhpdCB0ZWVfc3RtbV9lZmlfbW9kX2V4aXQodm9pZCkKLXsKLQlkcml2ZXJf
dW5yZWdpc3RlcigmdGVlX3N0bW1fZWZpX2RyaXZlci5kcml2ZXIpOwotfQotCi1tb2R1bGVfaW5p
dCh0ZWVfc3RtbV9lZmlfbW9kX2luaXQpOwotbW9kdWxlX2V4aXQodGVlX3N0bW1fZWZpX21vZF9l
eGl0KTsKK21vZHVsZV90ZWVfY2xpZW50X2RyaXZlcih0ZWVfc3RtbV9lZmlfZHJpdmVyKTsKIAog
TU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwogTU9EVUxFX0FVVEhPUigiSWxpYXMgQXBhbG9kaW1hcyA8
aWxpYXMuYXBhbG9kaW1hc0BsaW5hcm8ub3JnPiIpOwotLSAKMi40Ny4zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
