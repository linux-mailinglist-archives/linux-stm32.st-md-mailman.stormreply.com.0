Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CCC631A9B
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 08:49:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BCFDC65E50;
	Mon, 21 Nov 2022 07:49:14 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D50BC0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 01:55:10 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id me22so8764359ejb.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Nov 2022 17:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xM57jD3fRmCbS1XbxyoE71rQoQKI/Y1OhUjPEqjbJaQ=;
 b=3rYtqJtpfY1XBXHoPLhTx3RiVugMlkxe2v0zLw+nO9vnH8cUX3asUyAhkE6D6kmyWp
 drp2dTjwucgyTm8PVVJKpZOAK4nmKSkn3I7Ce4MIMuMc7FoBHHr5ThR4SgcoTI/tcs+K
 mic2r4ZLP7zKFSiz2L82z2/h3d/+OPoq6hhfDgDRTV3PFijIaosqnfdrf3a4Hpb3U51m
 qIYnhMr+qt8OsabDdSfGTG4yn2424+HAC0jedas2Oqqxs9gxAfWHgFyBRRLSanIq2yoF
 6JqOquRZzkLbVyM43ujFG7ZLMT0dfSznja6PgL9m4+B4WiTiazbf84x3UEcMlexyEezE
 rLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xM57jD3fRmCbS1XbxyoE71rQoQKI/Y1OhUjPEqjbJaQ=;
 b=35T24MxyEjLldAf8cHnXV9EgptTq2+VMRF5gGKwq3aIiMb/yng/+8NU/u58DnQFSbk
 8/BVq4qat4SJZfc6ZR1Zto5YQULhQZNda8VaIaTxf+voimCEJo/SVU/jjJ7vffQ2lDsr
 iHhsBJfbyhfOAr3Uu0hTAtHoiZr+eFh29nkbF8ElvoRcsoF4eSdLbSxLXEclbA9cRmk/
 129Gx0KQfRfLMzbFZ7ZnYxiyny/Tb9U2YNLqrK5Wdw6Tuc3pO4BoLhr7T1bEGDvLyhAn
 T4SNpxNgogLmIhCgyPmukejbs6gIjMABG241I7akJJoYrqlUfzDTkddjP0TBhmsEEHF+
 uKrw==
X-Gm-Message-State: ANoB5pl9+RzEkIVRKugTdRazkN53cO3K+XTP9CmGm73NXKii8hvSuNXe
 N6bSWLuV4nWTnzvcxfI0q4638g==
X-Google-Smtp-Source: AA0mqf6mpu5fXTEu5fclo9wzEMbRjLzOsiLY/jkrU0nKWzcU/tMWIGWZKzPzHzrd36r6DW0ahsh3lQ==
X-Received: by 2002:a17:907:d042:b0:78c:c893:1965 with SMTP id
 vb2-20020a170907d04200b0078cc8931965mr13152538ejc.247.1668995709816; 
 Sun, 20 Nov 2022 17:55:09 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 17:55:09 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Mon, 21 Nov 2022 02:54:46 +0100
Message-Id: <20221121015451.2471196-5-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Nov 2022 07:49:11 +0000
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/9] dt-bindings: pinctrl: st,
	stm32: Don't list pins-are-numbered as required
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

RG9uJ3QgbGlzdCB0aGUgcGlucy1hcmUtbnVtYmVyZWQgcHJvcGVydHkgYXMgcmVxdWlyZWQKClNp
Z25lZC1vZmYtYnk6IEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIgPGJlcm9AYmF5bGlicmUuY29tPgot
LS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3N0LHN0bTMyLXBp
bmN0cmwueWFtbCB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9zdCxzdG0zMi1w
aW5jdHJsLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9z
dCxzdG0zMi1waW5jdHJsLnlhbWwKaW5kZXggOWQ1OTIwOGQ4M2MxOC4uN2MwOGQzNjIxMzJhNCAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qs
c3RtMzItcGluY3RybC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waW5jdHJsL3N0LHN0bTMyLXBpbmN0cmwueWFtbApAQCAtMjA2LDcgKzIwNiw2IEBAIHJlcXVp
cmVkOgogICAtICcjYWRkcmVzcy1jZWxscycKICAgLSAnI3NpemUtY2VsbHMnCiAgIC0gcmFuZ2Vz
Ci0gIC0gcGlucy1hcmUtbnVtYmVyZWQKIAogYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCiAK
LS0gCjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
