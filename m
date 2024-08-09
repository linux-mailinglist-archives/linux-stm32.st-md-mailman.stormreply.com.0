Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9CE94C84A
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2024 03:55:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16135C78019;
	Fri,  9 Aug 2024 01:55:11 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7920C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2024 01:55:03 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-7163489149eso1124101a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Aug 2024 18:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723168502; x=1723773302;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g87pHTYNcLqKymqltlPERDjp4Tiu1YLllz5reVFVMbY=;
 b=AGw876xg3e+o9G5cc4R3KxND/lYklhrjy3R3vEIIcXOrriAORNxFSN1JWpwjmpkaYa
 9j23Mk9hvKR0isgCfPLFUW5khmZPt3Y6foqFx2xWjgzSMFv+vRB1gW+KEuCtgnkpUZlO
 lWeg79zPO8iiiW3OYYThDlTTo6jhXiNomBy2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723168502; x=1723773302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g87pHTYNcLqKymqltlPERDjp4Tiu1YLllz5reVFVMbY=;
 b=tQLE4zBEr5/2Dp8Z7IMKqUrUbB7D18uiKZZwGcSkfxmax5Lr2ZujCMys3uTxzcfU6L
 Gake7Rm6FjLCY0cBPIs/0QeW1xdWkOMsazAx5FQ8uPF+gtw7H5Mmw4eSf4lrsGIjqnVT
 cLsrlNg4Jv1oNWYlys0TUvEFe48PnHDGHf0JFFrwJXJHLAYy1U2gjetQIrwslFy27sgQ
 NnOz7DbeHdUKi38LSYe5GyqmfDd7KgZzKBfMaYbNwN584c4+gKpqEvglg4wrw32MZVlA
 rSJNhame3NdfF8NRWNbpdwODmBwwnta3vb494J9gQ2jnBtYbGsxUQ2HlxDzkNL1QL8u+
 VPfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXHPp2RU/PmIip2pgiSBOdEUQPXQZbh5UKlzaIr+8Nj6z4v/ImJoj3IAszQxDpYXFX40vPe7gTPUmJ6jE9OxPV+3EVdLSm3yH1q8pBmfT8uAeWLW8LWQ4r
X-Gm-Message-State: AOJu0YwTlxZPZGqaiRdfxj1sKTvUgpCq4QXzMMo2FCKyL3ovHTD3rcBh
 vuJ6oYPr1nZDpmJFPiw3Ip9BJPiUoOR+wFvQ50WiwkIq27HsSMQEfL+eorw0G7eRxCuzoVBDQry
 kxGuY3EOjB10qrLhe/xbxKv4o4pTDnya5Kwho
X-Google-Smtp-Source: AGHT+IFhGEBp9X1jQeNG940VeNl33LHf0TV1gzGb5GUUFhLURjI/GM1cHFs65SyyUqCs+rGzI9ShPh0OZ2G44L8CEr0=
X-Received: by 2002:a17:90b:1c0a:b0:2c9:9fcd:aa51 with SMTP id
 98e67ed59e1d1-2d1c336ef0emr4444371a91.5.1723168502167; Thu, 08 Aug 2024
 18:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-4-jitendra.vegiraju@broadcom.com>
 <c2e2f11a-89d8-42fa-a655-972a4ab372da@lunn.ch>
 <CAMdnO-JBznFpExduwCAm929N73Z_p4S4_nzRaowL9SzseqC6LA@mail.gmail.com>
 <de5b4d42-c81d-4687-b244-073142e2967b@lunn.ch>
In-Reply-To: <de5b4d42-c81d-4687-b244-073142e2967b@lunn.ch>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Thu, 8 Aug 2024 18:54:51 -0700
Message-ID: <CAMdnO-+_2Fy=uNgGevtnL8PGPvKyWXPvYaxOJwKcUZj+nnfqYg@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: hawk@kernel.org, daniel@iogearbox.net, linux@armlinux.org.uk,
 netdev@vger.kernel.org, richardcochran@gmail.com, john.fastabend@gmail.com,
 ast@kernel.org, linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Add PCI
	driver support for BCM8958x
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

T24gVHVlLCBBdWcgNiwgMjAyNCBhdCA0OjE14oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPiB3cm90ZToKPgo+IE9uIE1vbiwgQXVnIDA1LCAyMDI0IGF0IDA1OjU2OjQzUE0gLTA3MDAs
IEppdGVuZHJhIFZlZ2lyYWp1IHdyb3RlOgo+ID4gT24gRnJpLCBBdWcgMiwgMjAyNCBhdCA0OjA4
4oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPiB3cm90ZToKPiA+ID4KPiA+ID4gPiBN
YW5hZ2VtZW50IG9mIGludGVncmF0ZWQgZXRoZXJuZXQgc3dpdGNoIG9uIHRoaXMgU29DIGlzIG5v
dCBoYW5kbGVkIGJ5Cj4gPiA+ID4gdGhlIFBDSWUgaW50ZXJmYWNlLgo+ID4gPgo+ID4gPiBNRElP
PyBTUEk/IEkyQz8KPiA+ID4KPiA+IFRoZSBkZXZpY2UgdXNlcyBTUEkgaW50ZXJmYWNlLiBUaGUg
c3dpdGNoIGhhcyBpbnRlcm5hbCBBUk0gTTcgZm9yCj4gPiBjb250cm9sbGVyIGZpcm13YXJlLgo+
Cj4gV2lsbCB0aGVyZSBiZSBhIERTQSBkcml2ZXIgc29tZXRpbWUgc29vbiB0YWxraW5nIG92ZXIg
U1BJIHRvIHRoZQo+IGZpcm13YXJlPwo+CkhpIEFuZHJldywKTm8gdGhlcmUgaXMgbm8gcGxhbiB0
byBhZGQgRFNBIGRyaXZlci4KPiAgICAgICAgIEFuZHJldwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
