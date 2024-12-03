Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D259E201B
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Dec 2024 15:54:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43041C6C83D;
	Tue,  3 Dec 2024 14:54:16 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA689C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 14:54:08 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-21539e1d09cso52588935ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Dec 2024 06:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733237647; x=1733842447;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NxRWvpRh/XATlPemsVPOp1C/WgHKNO3eQaKjWVu9JCw=;
 b=XjNf58XXJS1KlSD0a2qqF1QJVKo449AZvZFgMG6NqmCzUaHR7of/NvgkWprOnt5uYI
 k+oq22ygbhLdM+KaGs6GyEsO59vx/O6yoNB1SYjGctDfDNksL/LuielZ/wJysur1HoP4
 osRKtN4rhNcRIEPdE9JVL6YJ5T4ma+gNy2Ul6J7/2I9avZAG2OkHrqWSF2psuMCoF0JJ
 Vx1vShH640aPNpMbl9wW/dggGrtMXgFZdXprwOqc416r33uPDJW5PYZ5sIaacJlk0Tgs
 7ycmkw8T9y2B9R27ddALcydG3rRjXzOU+Yt5LoGqSo9o6sjoPpkSeAsByVJbJUY5MusU
 5UqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733237647; x=1733842447;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NxRWvpRh/XATlPemsVPOp1C/WgHKNO3eQaKjWVu9JCw=;
 b=Y0E70B42wHax5G75f1h+bWKqjrqXi118cOian5PtaEJgE1W1lCqPwYpHRR7htTveFP
 K6v639uhoV2oZLP2W0CPyYOg2cd/80M33bw2ZqwGm/PSlfZvFguy71G0dUVMkDWiopZ9
 LtEolJD/fj+hvlVNeKpThkjCFA6hDq5IHtWzBNEGz8I31Bbb7vyXPJ/GMDgR7/ZLU+SL
 CNZmix9Qp1icp1PSfwrQALy+U8OailpILLvroK1t6jKMUTiP9D8kpEUxhzdv8z69inQH
 PgBx6qBbLBAJuzNfsgbvEpic3kQ4QCLkdv+qVGbRMOjluEVFRarHQ+e7qPtYG3HrGzUw
 ZZig==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/qEmrgKkOTuZ68OZSrNAAefqMlexX1O+tibrULh8mmz5rktL4BMrrFeaiv8eACPvTtHuLwCeuzlZ/Gw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzTHhqj+PcdhPSMUR+0Ixx6q75QXXVOBRkETjccdZF/eVUC55oX
 ZAFyhGxHnBzKHrQg6OwlpfjiQfZrlJ4e3jRvVT21vii8vFvhm6TA8+Db4bWXiA==
X-Gm-Gg: ASbGnctGQeL2oO/b4xFV6zkKWYJjwZTLpIfnMKh9rAXnjf4EIu6L7fGAjS7uueX0rw8
 Xze8lWUN4LMvaVtxSC90gCpQuhoidNqn2kKNKnAo6fOr9dzpRIMhqJzb9hp0H4LJ883TH6UCG14
 MvpRpgphwzcGTevINY6CrhUFVWqfw0NxirBxbyozL6XVXhFeKvgpEw/cBpZZGjdOWaaUphotBt5
 WVl0owMNfHdj0iNS9vO2/U7K2j/l38dx6NX5eUTL2xmrh/YocE0qdOQ6QuL
X-Google-Smtp-Source: AGHT+IG1jXS9xGAq/FRf8FrbfE+7Y1wmH9mz8EtqoFxLQOYNOcGvJFOa6X0SdbkbLcjrMI9kzEqtkw==
X-Received: by 2002:a17:902:f543:b0:20c:a44b:3221 with SMTP id
 d9443c01a7336-215bd1cb76emr33584985ad.15.1733237647391; 
 Tue, 03 Dec 2024 06:54:07 -0800 (PST)
Received: from thinkpad ([120.60.48.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21565f24c59sm56675255ad.125.2024.12.03.06.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 06:54:06 -0800 (PST)
Date: Tue, 3 Dec 2024 20:24:01 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20241203145401.7snlxk3sybufaqp2@thinkpad>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-4-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241126155119.1574564-4-christian.bruel@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 cassel@kernel.org, devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/5] dt-bindings: PCI: Add STM32MP25
 PCIe endpoint bindings
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

T24gVHVlLCBOb3YgMjYsIDIwMjQgYXQgMDQ6NTE6MTdQTSArMDEwMCwgQ2hyaXN0aWFuIEJydWVs
IHdyb3RlOgo+IFNUTTMyTVAyNSBQQ0llIENvbnRyb2xsZXIgaXMgYmFzZWQgb24gdGhlIERlc2ln
bldhcmUgY29yZSBjb25maWd1cmVkIGFzCj4gZW5kIHBvaW50IG1vZGUgZnJvbSB0aGUgU1lTQ0ZH
IHJlZ2lzdGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBCcnVlbCA8Y2hyaXN0aWFu
LmJydWVsQGZvc3Muc3QuY29tPgoKQWNrZWQtYnk6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFu
aXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+CgotIE1hbmkKCj4gLS0tCj4gIC4uLi9iaW5k
aW5ncy9wY2kvc3Qsc3RtMzItcGNpZS1lcC55YW1sICAgICAgICB8IDYxICsrKysrKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvc3Qsc3RtMzItcGNp
ZS1lcC55YW1sCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wY2kvc3Qsc3RtMzItcGNpZS1lcC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BjaS9zdCxzdG0zMi1wY2llLWVwLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMGRhM2VlMDEyYmE4Cj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvc3Qsc3RtMzItcGNpZS1l
cC55YW1sCj4gQEAgLTAsMCArMSw2MSBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAo
R1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9wY2kvc3Qsc3RtMzItcGNpZS1lcC55YW1sIwo+ICsk
c2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiAr
Cj4gK3RpdGxlOiBTVE0zMk1QMjUgUENJZSBlbmRwb2ludCBkcml2ZXIKPiArCj4gK21haW50YWlu
ZXJzOgo+ICsgIC0gQ2hyaXN0aWFuIEJydWVsIDxjaHJpc3RpYW4uYnJ1ZWxAZm9zcy5zdC5jb20+
Cj4gKwo+ICtkZXNjcmlwdGlvbjoKPiArICBQQ0llIGVuZHBvaW50IGNvbnRyb2xsZXIgYmFzZWQg
b24gdGhlIFN5bm9wc3lzIERlc2lnbldhcmUgUENJZSBjb3JlLgo+ICsKPiArYWxsT2Y6Cj4gKyAg
LSAkcmVmOiAvc2NoZW1hcy9wY2kvc25wcyxkdy1wY2llLWVwLnlhbWwjCj4gKyAgLSAkcmVmOiAv
c2NoZW1hcy9wY2kvc3Qsc3RtMzItcGNpZS1jb21tb24ueWFtbCMKPiArCj4gK3Byb3BlcnRpZXM6
Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIGNvbnN0OiBzdCxzdG0zMm1wMjUtcGNpZS1lcAo+ICsK
PiArICByZWc6Cj4gKyAgICBpdGVtczoKPiArICAgICAgLSBkZXNjcmlwdGlvbjogRGF0YSBCdXMg
SW50ZXJmYWNlIChEQkkpIHJlZ2lzdGVycy4KPiArICAgICAgLSBkZXNjcmlwdGlvbjogUENJZSBj
b25maWd1cmF0aW9uIHJlZ2lzdGVycy4KPiArCj4gKyAgcmVnLW5hbWVzOgo+ICsgICAgaXRlbXM6
Cj4gKyAgICAgIC0gY29uc3Q6IGRiaQo+ICsgICAgICAtIGNvbnN0OiBhZGRyX3NwYWNlCj4gKwo+
ICtyZXF1aXJlZDoKPiArICAtIHJlc2V0LWdwaW9zCj4gKwo+ICt1bmV2YWx1YXRlZFByb3BlcnRp
ZXM6IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArICAgICNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMjUtcmNjLmg+Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvZ3Bpby9ncGlvLmg+Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGh5L3BoeS5o
Pgo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L3N0LHN0bTMybXAyNS1yY2MuaD4K
PiArCj4gKyAgICBwY2llLWVwQDQ4NDAwMDAwIHsKPiArICAgICAgICBjb21wYXRpYmxlID0gInN0
LHN0bTMybXAyNS1wY2llLWVwIjsKPiArICAgICAgICBudW0tbGFuZXMgPSA8MT47Cj4gKyAgICAg
ICAgcmVnID0gPDB4NDg0MDAwMDAgMHg0MDAwMDA+LAo+ICsgICAgICAgICAgICAgIDwweDEwMDAw
MDAwIDB4ODAwMDAwMD47Cj4gKyAgICAgICAgcmVnLW5hbWVzID0gImRiaSIsICJhZGRyX3NwYWNl
IjsKPiArICAgICAgICBjbG9ja3MgPSA8JnJjYyBDS19CVVNfUENJRT47Cj4gKyAgICAgICAgcGh5
cyA9IDwmY29tYm9waHkgUEhZX1RZUEVfUENJRT47Cj4gKyAgICAgICAgcGh5LW5hbWVzID0gInBj
aWUtcGh5IjsKPiArICAgICAgICByZXNldHMgPSA8JnJjYyBQQ0lFX1I+Owo+ICsgICAgICAgIHBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJpbml0IjsKPiArICAgICAgICBwaW5jdHJsLTAgPSA8
JnBjaWVfcGluc19hPjsKPiArICAgICAgICBwaW5jdHJsLTEgPSA8JnBjaWVfaW5pdF9waW5zX2E+
Owo+ICsgICAgICAgIHJlc2V0LWdwaW9zID0gPCZncGlvaiA4IEdQSU9fQUNUSVZFX0xPVz47Cj4g
KyAgICAgICAgYWNjZXNzLWNvbnRyb2xsZXJzID0gPCZyaWZzYyA2OD47Cj4gKyAgICAgICAgcG93
ZXItZG9tYWlucyA9IDwmQ0xVU1RFUl9QRD47Cj4gKyAgICB9Owo+IC0tIAo+IDIuMzQuMQo+IAoK
LS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
