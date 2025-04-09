Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 836FBA81E40
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Apr 2025 09:27:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AA0DC78F98;
	Wed,  9 Apr 2025 07:27:16 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF954C78F95
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Apr 2025 07:27:14 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-af55b7d56a1so4637227a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Apr 2025 00:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744183633; x=1744788433;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bjtp5uxq5PJR8SPbumJFOhR6APtRTEBkqcgJtZZs/yI=;
 b=DcXRhw3fFV+ekC0Fv/nNOtXk5F1lRIVGN6FE9OF3SgJWmYH3MnL+zM6rekC9/ulk2A
 eltyiXCuM4bLePwvcfs0E1Alp2AKtByK5njv92lzpZghuQYyJc2l0N42m3Kb0jZDXuUQ
 GvQqBxRLf8GEOgSo1nAybiN4sEVm8ErxfI+z2o/gkEJ7PHi6kILvp74Q1d2DQJ0WCIss
 UhRaHNrL8UsryI1Yr+0hi+SwOTXy8jGZuisLdDzqiDHAidvttEaEymM8kcmpupdwChCa
 2Cj4DoU8dM1Lbyer5+ppt/ukAYpEiZgnhAMq59xMhObUramlWJmPNPva2C1v4/F3XA6a
 aaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744183633; x=1744788433;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bjtp5uxq5PJR8SPbumJFOhR6APtRTEBkqcgJtZZs/yI=;
 b=W4ucD0o6x/i2+tNtCg4iuTk/s7T43MXkYoZlsFCtdKcXCkwU+CBtlYVWaMD/OThfSR
 JDfS1v0mm6tV3nm/K/Br/407Q64JC+LPhA3iVOZtJB4GszcOHko5j+nYdHWui9qMoM3l
 JhhG+1vfPY65SBE2zQP+gs2JUh2x7QZpUG0biHQHMP2aiqc+NpgZHTn/WX8Fa5oyb82l
 plV28WbhCH7cLj5D/rDWIAvcZkCKAxcEkh1OVYSSciCDstcxLLju336WvUq+TXRrs8+s
 386X8ZEVrtHu53HFqhjRECEN+Zrz1AIGNbHsEj+q7s/9klGHkbFbqyBLQmo+fUVb3MIw
 fKqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcEy3TMul1ZOGVBfrsONx2uXTfLYePKMfE6+8ODYcoFTt3aAvSLomEQZSRhn0MR7P2ASMYBBXeEXGpeA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw3na6qcwF86j8D7nyST+9L/Foikqg1SjbNAW38vYcmrZidSOsu
 5xhFNcsVy4l/K1j/1yabCIavePgwU/32oJbiLugPGkFwvFBa6OW8OTq4WJ7tTg==
X-Gm-Gg: ASbGncs3Q8oqyV0Rou9mqbMQIlmu2b0cQUmSeISuehozC0+XyC5w2X47yCzga8dqTD2
 iwJbRK7g3PJ8kp4R9rnBN/KjgXAzAHbhE3Tnrzlc605gQ+RDHwf+SlrS9GazXMGzR9T8jsjfMd4
 99DuttJ3HBpZD4k5nd0JHk66R3uyn1DBjMP505U9q0XJG1jSvT+/EQIiBu12ejS7EJlWlg7OjJO
 XSJsIhp5TxwlxX2i62gUpXM1rpMKsxi9jS7oiyshP6+wLpEeNd952OdlsjPrFjbmj4Yt4g4dTtt
 0vYszwgSuRiErqAF9yENiXNIsCKEPR4S+0x3ORCovYJeaEj/PQgoclmAlSTnqQ==
X-Google-Smtp-Source: AGHT+IFJNOB7FQRc/Tw1WyrEz0Y4erL5DJ65iCK7Rvye19VpLIDU8oQWce0axOQ4lCLAH8Qrt4ZW7g==
X-Received: by 2002:a05:6a20:c88f:b0:1f5:6d00:ba05 with SMTP id
 adf61e73a8af0-201592e1b96mr2765473637.38.1744183633456; 
 Wed, 09 Apr 2025 00:27:13 -0700 (PDT)
Received: from thinkpad ([120.56.198.53]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b02a322117bsm469422a12.64.2025.04.09.00.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 00:27:12 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:57:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <ku3lsolnbbwwlngi54lpe4j6s476rhxi662vqvlwwua4sos4du@b6j6zofrpuuy>
References: <20250325065935.908886-1-christian.bruel@foss.st.com>
 <20250325065935.908886-2-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250325065935.908886-2-christian.bruel@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, kw@linux.com, conor+dt@kernel.org,
 p.zabel@pengutronix.de, robh@kernel.org, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, linux-kernel@vger.kernel.org, cassel@kernel.org,
 devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, johan+linaro@kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 1/9 RESEND] dt-bindings: PCI: Add
 STM32MP25 PCIe Root Complex bindings
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

T24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgMDc6NTk6MjdBTSArMDEwMCwgQ2hyaXN0aWFuIEJydWVs
IHdyb3RlOgo+IERvY3VtZW50IHRoZSBiaW5kaW5ncyBmb3IgU1RNMzJNUDI1IFBDSWUgQ29udHJv
bGxlciBjb25maWd1cmVkIGluCj4gcm9vdCBjb21wbGV4IG1vZGUgd2l0aCBvbmUgcm9vdCBwb3J0
Lgo+IAo+IFN1cHBvcnRzIDQgSU5UeCBhbmQgTVNJIGludGVycnVwdHMgZnJvbSB0aGUgQVJNIEdJ
Q3YybSBjb250cm9sbGVyLgo+IAo+IFNUTTMyIFBDSWUgbWF5IGJlIGluIGEgcG93ZXIgZG9tYWlu
IHdoaWNoIGlzIHRoZSBjYXNlIGZvciB0aGUgU1RNMzJNUDI1Cj4gYmFzZWQgYm9hcmRzLgo+IAo+
IFN1cHBvcnRzIFdBS0UjIGZyb20gd2FrZS1ncGlvcwo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBCcnVlbCA8Y2hyaXN0aWFuLmJydWVsQGZvc3Muc3QuY29tPgoKQWNrZWQtYnk6IE1hbml2
YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+CgpPbmUg
Y29tbWVudCBiZWxvdy4KCj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtl
cm5lbC5vcmc+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9wY2kvc3Qsc3RtMzItcGNpZS1jb21tb24u
eWFtbCAgICB8ICAzMyArKysrKysKPiAgLi4uL2JpbmRpbmdzL3BjaS9zdCxzdG0zMi1wY2llLWhv
c3QueWFtbCAgICAgIHwgMTEyICsrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQs
IDE0NSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGNpL3N0LHN0bTMyLXBjaWUtY29tbW9uLnlhbWwKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvc3Qsc3Rt
MzItcGNpZS1ob3N0LnlhbWwKPiAKClsuLi5dCgo+ICsgICAgcGNpZUA0ODQwMDAwMCB7Cj4gKyAg
ICAgICAgY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMjUtcGNpZS1yYyI7Cj4gKyAgICAgICAgZGV2
aWNlX3R5cGUgPSAicGNpIjsKPiArICAgICAgICByZWcgPSA8MHg0ODQwMDAwMCAweDQwMDAwMD4s
Cj4gKyAgICAgICAgICAgICAgPDB4MTAwMDAwMDAgMHgxMDAwMD47Cj4gKyAgICAgICAgcmVnLW5h
bWVzID0gImRiaSIsICJjb25maWciOwo+ICsgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47
Cj4gKyAgICAgICAgaW50ZXJydXB0LW1hcC1tYXNrID0gPDAgMCAwIDc+Owo+ICsgICAgICAgIGlu
dGVycnVwdC1tYXAgPSA8MCAwIDAgMSAmaW50YyAwIDAgR0lDX1NQSSAyNjQgSVJRX1RZUEVfTEVW
RUxfSElHSD4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIDwwIDAgMCAyICZpbnRjIDAgMCBH
SUNfU1BJIDI2NSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgPDAgMCAwIDMgJmludGMgMCAwIEdJQ19TUEkgMjY2IElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICA8MCAwIDAgNCAmaW50YyAwIDAgR0lDX1NQSSAyNjcg
SVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mz47Cj4g
KyAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47Cj4gKyAgICAgICAgcmFuZ2VzID0gPDB4MDEwMDAw
MDAgMHgwIDB4MDAwMDAwMDAgMHgxMDAxMDAwMCAweDAgMHgxMDAwMD4sCj4gKyAgICAgICAgICAg
ICAgICAgPDB4MDIwMDAwMDAgMHgwIDB4MTAwMjAwMDAgMHgxMDAyMDAwMCAweDAgMHg3ZmUwMDAw
PiwKPiArICAgICAgICAgICAgICAgICA8MHg0MjAwMDAwMCAweDAgMHgxODAwMDAwMCAweDE4MDAw
MDAwIDB4MCAweDgwMDAwMDA+Owo+ICsgICAgICAgIGRtYS1yYW5nZXMgPSA8MHg0MjAwMDAwMCAw
eDAgMHg4MDAwMDAwMCAweDgwMDAwMDAwIDB4MCAweDgwMDAwMDAwPjsKPiArICAgICAgICBjbG9j
a3MgPSA8JnJjYyBDS19CVVNfUENJRT47Cj4gKyAgICAgICAgcmVzZXRzID0gPCZyY2MgUENJRV9S
PjsKPiArICAgICAgICBtc2ktcGFyZW50ID0gPCZ2Mm0wPjsKPiArICAgICAgICBhY2Nlc3MtY29u
dHJvbGxlcnMgPSA8JnJpZnNjIDY4PjsKPiArICAgICAgICBwb3dlci1kb21haW5zID0gPCZDTFVT
VEVSX1BEPjsKPiArCj4gKyAgICAgICAgcGNpZUAwLDAgewo+ICsgICAgICAgICAgZGV2aWNlX3R5
cGUgPSAicGNpIjsKCkluZGVudGF0aW9uIGlzIG9mZiBieSAyIHNwYWNlcy4KCi0gTWFuaQoKLS0g
CuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
