Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E174C946533
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 23:43:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87F3FC7129D;
	Fri,  2 Aug 2024 21:43:24 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91964C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 21:43:17 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-7aa7703cf08so6507082a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Aug 2024 14:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722634996; x=1723239796;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9vMHdVSrXJF8XYak0iSBlyxgzNiJzotPPn7gmZpMrkY=;
 b=fCoLq6EzlC8N0Mt0fV8zNfe0vB++9X5Yg+WA5AUIH0aH8sADbTOOHYaMq6/iN5eRkq
 Gao9tGB2w6LGb+NfBrBhfpN1vZ3O3Eubl2e3iXLhofqNcLbnHBUUEsfVLGuwtyDTFv06
 LE22HGj5DeY0WfcPYiFbXFaKfjt30gElgfAyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722634996; x=1723239796;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9vMHdVSrXJF8XYak0iSBlyxgzNiJzotPPn7gmZpMrkY=;
 b=shJOMwPmgp3IHzIKw/atbF60SI+kRMt8fQVZD2hEjGiZSOIK7N3aBW1Slzh8bWlN9d
 WlAy/w/CAb+T7e53+T3ErQ7ukFKfU0vHn8GM0H1Ak94uvDzUfISdRWyIO8RTGwX9kDhi
 VvH5gsg1KYfqNuYECGz8TFQx187+J8yxzWWJAopc+//dN//fgQz5A8p7unPh+XtcXnz7
 XThn09h3JDlr9JUtL22rPFtMl7hxhQ45UO4xBoDcP3UwT4IOKn2kpgUbF4yqH+oZSrmS
 YuH5Z226vk9ZMNOBXb4mOQUVvQf+AFipSU5bKsHiNWhR35d24UtJizecx9KAPhZqCbIt
 vOMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk/b/ywXYSiS4lefrVoSI8T0zrcXlnlFTOo+qpafgd+/L7Y1738SJrNr/hCYItIeUfCa38KhAmOicHCgouyEz7GOJfv1NItDSy7tk36gow9SP7dNNxQ/0x
X-Gm-Message-State: AOJu0Yzq0+L9SkwSz3Dch0PPmWCkcN0pqv1qb0VcoDKNfkk3T8w9BgQ+
 bJlNFioBQukp3viCFphPEqoyH9xMhSGibVouy393Z6EmrbRigqkFTF4dSR12MJz28ARKZjGmJuw
 BgYMKd7AvxFpVsvfI6I9k2+S5g5gMUGbKDfa6
X-Google-Smtp-Source: AGHT+IEtvLrcXhCLETX+9N9XQkX7L9HzPL+GHPynwB9luwQ69BeemNXYJLs+adSVkzdD9GLwGnf0wExUCNvvTJfPf+s=
X-Received: by 2002:a17:90a:f02:b0:2cd:ba3e:38a5 with SMTP id
 98e67ed59e1d1-2cff9469006mr5802105a91.21.1722634996112; Fri, 02 Aug 2024
 14:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-2-jitendra.vegiraju@broadcom.com>
 <ZqyXE0XJkn+Of6rR@shell.armlinux.org.uk>
In-Reply-To: <ZqyXE0XJkn+Of6rR@shell.armlinux.org.uk>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Fri, 2 Aug 2024 14:43:05 -0700
Message-ID: <CAMdnO-+_w=XTE7TPv-b6RtAbjK1CC9jgf1kukmg9W-_0Dj8O2A@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hawk@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, richardcochran@gmail.com, john.fastabend@gmail.com,
 ast@kernel.org, linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] net: stmmac: Add basic
 dwxgmac4 support to stmmac core
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

U29ycnkgZm9yIHJlcG9zdGluZywgcmVzZW5kaW5nIHRoZSByZXBseSBzaW5jZSBJIG1pc3NlZCBy
ZXBseSB0byBhbGwuCgpPbiBGcmksIEF1ZyAyLCAyMDI0IGF0IDE6MjHigK9BTSBSdXNzZWxsIEtp
bmcgKE9yYWNsZSkKPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1
ZyAwMSwgMjAyNCBhdCAwODoxODoyMFBNIC0wNzAwLCBqaXRlbmRyYS52ZWdpcmFqdUBicm9hZGNv
bS5jb20gd3JvdGU6Cj4gPiArc3RhdGljIGludCByZF9kbWFfY2hfaW5kKHZvaWQgX19pb21lbSAq
aW9hZGRyLCB1OCBtb2RlLCB1MzIgY2hhbm5lbCkKPiA+ICt7Cj4gPiArICAgICB1MzIgcmVnX3Zh
bCA9IDA7Cj4gPiArICAgICB1MzIgdmFsID0gMDsKPgo+IHZhbCBpcyB1bm5lY2Vzc2FyeS4KVHJ1
ZSwgSSB3aWxsIGZpeCBpdC4KPgo+ID4gKwo+ID4gKyAgICAgcmVnX3ZhbCB8PSBtb2RlIDw8IFhH
TUFDNF9NU0VMX1NISUZUICYgWEdNQUM0X01PREVfU0VMRUNUOwo+Cj4gQ29uc2lkZXIgdXNpbmc6
Cj4KPiAgICAgICAgIHJlZ192YWwgfD0gRklFTERfUFJFUChYR01BQzRfTU9ERV9TRUxFQ1QsIG1v
ZGUpOwo+ClRoYW5rcywgSSB3aWxsIG1ha2UgdGhlIGNoYW5nZXMuCgo+IGFuZCBzaW1pbGFybHkg
ZXZlcnl3aGVyZSBlbHNlIHlvdSB1c2UgYSBzaGlmdCBhbmQgbWFzay4gV2l0aCB0aGlzLCB5b3UK
PiBjYW4gcmVtb3ZlIF9hbGxfIF9TSElGVCBkZWZpbml0aW9ucyBpbiB5b3VyIGhlYWRlciBmaWxl
Lgo+Cj4gPiArICAgICByZWdfdmFsIHw9IGNoYW5uZWwgPDwgWEdNQUM0X0FPRkZfU0hJRlQgJiBY
R01BQzRfQUREUl9PRkZTRVQ7Cj4gPiArICAgICByZWdfdmFsIHw9IFhHTUFDNF9DTURfVFlQRSB8
IFhHTUFDNF9PQjsKPiA+ICsgICAgIHdyaXRlbChyZWdfdmFsLCBpb2FkZHIgKyBYR01BQzRfRE1B
X0NIX0lORF9DT05UUk9MKTsKPiA+ICsgICAgIHZhbCA9IHJlYWRsKGlvYWRkciArIFhHTUFDNF9E
TUFfQ0hfSU5EX0RBVEEpOwo+ID4gKyAgICAgcmV0dXJuIHZhbDsKPgo+ICAgICAgICAgcmV0dXJu
IHJlYWRsKGlvYWRkciArIFhHTUFDNF9ETUFfQ0hfSU5EX0RBVEEpOwo+Cj4gLi4uCj4KPiA+ICt2
b2lkIGR3eGdtYWM0X2RtYV9pbml0KHZvaWQgX19pb21lbSAqaW9hZGRyLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IHN0bW1hY19kbWFfY2ZnICpkbWFfY2ZnLCBpbnQgYXRkcykKPiA+
ICt7Cj4gPiArICAgICB1MzIgdmFsdWU7Cj4gPiArICAgICB1MzIgaTsKPiA+ICsKPiA+ICsgICAg
IHZhbHVlID0gcmVhZGwoaW9hZGRyICsgWEdNQUNfRE1BX1NZU0JVU19NT0RFKTsKPiA+ICsKPiA+
ICsgICAgIGlmIChkbWFfY2ZnLT5hYWwpCj4gPiArICAgICAgICAgICAgIHZhbHVlIHw9IFhHTUFD
X0FBTDsKPiA+ICsKPiA+ICsgICAgIGlmIChkbWFfY2ZnLT5lYW1lKQo+ID4gKyAgICAgICAgICAg
ICB2YWx1ZSB8PSBYR01BQ19FQU1FOwo+Cj4gV2hhdCBpZiBkbWFfY2ZnIGRvZXNuJ3QgaGF2ZSB0
aGVzZSBiaXRzIHNldD8gSXMgaXQgcG9zc2libGUgdGhleSB3aWxsIGJlCj4gc2V0IGluIHRoZSBy
ZWdpc3Rlcj8KVGhlIHJlc2V0IGRlZmF1bHQgZm9yIHRoZXNlIGJpdHMgaXMgemVyby4KPgo+IFRo
YW5rcy4KPgo+IC0tCj4gUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5v
cmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCj4gRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1i
cHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
