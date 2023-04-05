Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7858D6D79ED
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 12:39:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29797C6A610;
	Wed,  5 Apr 2023 10:39:29 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 531B6C6A606
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 10:39:27 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id y4so139956943edo.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Apr 2023 03:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112; t=1680691167;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+OWu93YrqWr/zEhqySFx58McOCzQoD5fkplN4ZAYNo=;
 b=UcAaRKILFQhDt9GYBtqWAuPWyKKq3Wv0oCYW98FzjwYGpYFlAQBd0gX8sXr8sXfOcc
 H9mRKWpZsNHzJO9W9WxtztHw2l9kH1IUc5cTzn8GSLIb2RMB1xhkeTQygJDWmWGKlAtV
 sMJC0E0+CwsZkSJL5gk3RjeZmekFyy1u/LwX/hlthyWWvu3TmEEeLOdL/+mPtwu99pBz
 etKgL7/OBB5KFwkIuiJRZevnzr/gMEOK22WjQ9Ta7MIFsPBHarBAlyoqPI1G4SXU9YPL
 zKeHwpjm175J2OQAeHten/PwxILkALiqoYPDYIOJycn39KNijhtfBN13R+JpTy7KS8Tk
 owyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680691167;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m+OWu93YrqWr/zEhqySFx58McOCzQoD5fkplN4ZAYNo=;
 b=tDfttndbtHMnPK+8ZIg2CKdUIdgUqO/Tfg4P92A3PeQp71WQiVjsJOnefdQrJoms36
 fZd1IAyvDi8k1gDYWOvfEtqQI1b3EdvYsXWU342B0/pvGcztFmLmNblX+XfhL+zj9b04
 7VEispZvwDTBAH0rp+w6qLcC/AVKvVDnHaPV3VXCADBhA4oC5ol68Slrbxto7cTEjpqb
 f0Q+JZOB93wRjVcOqy8jKefXlA0aw9suawUqOkMFMOEr6BjfgbLYRIMkU4ckcEHXslil
 OnKf26RnaLHzvjT3uaIpbQF5rYMbyVwboIg4LoQrUDrq1q5zlG2nRpEisePZR1tZadd7
 WyEw==
X-Gm-Message-State: AAQBX9fJ/JpumpXxCrtstfXUguS5hWKRzmQpuas6QQ/nbqk6ZbfIDHsP
 KyGU/6UjoNu4hIfF7gaALFf4Y0tYUlzVvJl7OaU=
X-Google-Smtp-Source: AKy350aLbijKiNdkK8SHm4i29BovFlyRXNTjWiSHmeQXz0hOZ9d1gr6/yFY+oc4DYB8xrmBFC2F21GmCtMlZC+NLB1M=
X-Received: by 2002:a17:907:8c0b:b0:92f:41e4:e48b with SMTP id
 ta11-20020a1709078c0b00b0092f41e4e48bmr1293430ejc.6.1680691166633; Wed, 05
 Apr 2023 03:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230405093945.3549491-1-michael.wei.hong.sit@intel.com>
In-Reply-To: <20230405093945.3549491-1-michael.wei.hong.sit@intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 5 Apr 2023 12:39:15 +0200
Message-ID: <CAFBinCDUX0O1E7_cToxvrCjWboSSX1Dj5rUaC6OcRT5=Vyrn5g@mail.gmail.com>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Cc: andrew@lunn.ch, Voon Weifeng <weifeng.voon@intel.com>,
 Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Eric Dumazet <edumazet@google.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, hock.leong.kweh@intel.com,
 linux@armlinux.org.uk, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Tan Tee Min <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Zulkifli Muhammad Husaini <muhammad.husaini.zulkifli@intel.com>,
 "David S . Miller" <davem@davemloft.net>, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: check fwnode for phy
 device before scanning for phy
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

T24gV2VkLCBBcHIgNSwgMjAyMyBhdCAxMTo0MOKAr0FNIE1pY2hhZWwgU2l0IFdlaSBIb25nCjxt
aWNoYWVsLndlaS5ob25nLnNpdEBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gU29tZSBEVCBkZXZpY2Vz
IGFscmVhZHkgaGF2ZSBwaHkgZGV2aWNlIGNvbmZpZ3VyZWQgaW4gdGhlIERUL0FDUEkuCj4gQ3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiBzY2FucyBmb3IgYSBwaHkgdW5jb25kaXRpb25hbGx5IGV2ZW4g
dGhvdWdoCj4gdGhlcmUgaXMgYSBwaHkgbGlzdGVkIGluIHRoZSBEVC9BQ1BJIGFuZCBhbHJlYWR5
IGF0dGFjaGVkLgo+Cj4gV2Ugc2hvdWxkIGNoZWNrIHRoZSBmd25vZGUgaWYgdGhlcmUgaXMgYW55
IHBoeSBkZXZpY2UgbGlzdGVkIGluCj4gZndub2RlIGFuZCBkZWNpZGUgd2hldGhlciB0byBzY2Fu
IGZvciBhIHBoeSB0byBhdHRhY2ggdG8ueQo+Cj4gUmVwb3J0ZWQtYnk6IE1hcnRpbiBCbHVtZW5z
dGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cj4gRml4ZXM6IGZlMmNm
YmM5NjgwMyAoIm5ldDogc3RtbWFjOiBjaGVjayBpZiBNQUMgbmVlZHMgdG8gYXR0YWNoIHRvIGEg
UEhZIikKPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFNpdCBXZWkgSG9uZyA8bWljaGFlbC53ZWku
aG9uZy5zaXRAaW50ZWwuY29tPgpUaGlzIGFsc28gd29ya3MgZ3JlYXQgb24gbXkgWDk2IEFpciAo
YW5kIEkgcHJlc3VtZSBpdCB3aWxsIGZpeCBhbGwKb3RoZXIgQW1sb2dpYyBib2FyZHMpOgpUZXN0
ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFp
bC5jb20+CgoKVGhhbmtzIGEgbG90IGZvciBiZWluZyBzbyBxdWljayB3aXRoIHRoaXMgZml4IQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
