Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8184395857F
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 13:14:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FB3FC6DD66;
	Tue, 20 Aug 2024 11:14:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A011CCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 11:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724152465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BTT1Q6GxIm9St48gKvu8Ozg5Txh7Do+nIOAs2Z9Upuo=;
 b=alU1ouL2HHmGo3pefUWlvcuSlN+U89VeS9UoAoPY+0hYmXk/V8aW1Q1q5zLriPPNOdeKua
 7alqhC/zsuaqAZ3weGB+OkMdEaadEyqE43mkgXYP8y1dCbjKv1ss+pmFU4PjfVH5CKiKhg
 ymAK35zpPs93e7U8KZJzSgqb3qf7MCs=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-XZ5qGk5UON-rJbnRVIaIRw-1; Tue, 20 Aug 2024 07:14:24 -0400
X-MC-Unique: XZ5qGk5UON-rJbnRVIaIRw-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-53331ba4abcso221622e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 04:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724152463; x=1724757263;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y1Q7acyOuQZwg2/89j6b8m+Ec7sRWq6gAjTgotRXIu4=;
 b=iicJAQIWoO+AOi2gbemKp7AuDBjrGyu/L+k7klo1QJNuAIKgOv4Gx2r5/LkOF1tVHU
 E8c7wOhCeVPXvpuiJ/pZfDJA8FsZFGOfeAPidb18QA1PMHsaeXNJ/ceJ17q4aYfd8Po4
 KEdzpzMJ1sHdBt5Vm2SPl7Elun2FqV4U2Lg9OreooSxmMVOp6w5xbT/pJf342au+t+In
 jSmzqadqHrsF2GhzRVdfLXN7en1nZMVQtJob1qXi0luGNg7C8j16pe53hBBOYb3x+8IV
 jwjrXAhI/3uvpDDVECtrevq62aSDa+DVjqr9Fa12jKgeKFP1pJiNLoObfsjVRDz9jHPe
 YD+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtyYJG8pfAcWkQA4HWA755XPJjhkyTQ4KVgtaeCMJy067oYXektN2GBqfkxA1INaRZhsTtZetQDEpLFpkB7FXxMjc0KFy74Pos3z0Af/h1efhaBQHKSOBy
X-Gm-Message-State: AOJu0YwBSxmf5bVt23NotYnrCyv9gH4RdXJmu+V6Tx7YHDKKqO/H6yZ1
 Tt2FgNHqZr+0pExNMM6enNTmFG2X8gAqfOaC7v3DCS5V5fiU9L+ckidMIwoIblkdldP0aHN7+Pz
 R4jDOfu//fkzVA1uHpxhmMnmmsTX4R8MgIaJ6SQNAYwU5bLiNoBI/zO53Z/tS7tZFgvG20LpVrj
 teoA==
X-Received: by 2002:a05:6512:3c84:b0:530:baec:3975 with SMTP id
 2adb3069b0e04-5331c6904bamr5596048e87.1.1724152463001; 
 Tue, 20 Aug 2024 04:14:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYdlvki0skRqSH7C03GeJxZqEQK+y/koEXnizdbc6P1v4DyVRhp4tYp6FmBEQj38Z0lN9WKg==
X-Received: by 2002:a05:6512:3c84:b0:530:baec:3975 with SMTP id
 2adb3069b0e04-5331c6904bamr5596024e87.1.1724152462340; 
 Tue, 20 Aug 2024 04:14:22 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dcc:1f00:bec1:681e:45eb:77e2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383935657sm747366866b.138.2024.08.20.04.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 04:14:22 -0700 (PDT)
Message-ID: <01b1e7d505a2b3e670f1613ce3e6a60efd3449ab.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 20 Aug 2024 13:14:20 +0200
In-Reply-To: <d35a962d-dc95-4469-867e-95b704cca474@wanadoo.fr>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-10-pstanner@redhat.com>
 <74e9109a-ac59-49e2-9b1d-d825c9c9f891@wanadoo.fr>
 <3e4288bb7300f3fd0883ff07b75ae69d0532019b.camel@redhat.com>
 <d35a962d-dc95-4469-867e-95b704cca474@wanadoo.fr>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-doc@vger.kernel.org, alvaro.karsz@solid-run.com,
 linux-pci@vger.kernel.org, linus.walleij@linaro.org, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, xuanzhuo@linux.alibaba.com,
 corbet@lwn.net, brgl@bgdev.pl, mst@redhat.com, eperezma@redhat.com,
 joabreu@synopsys.com, trix@redhat.com, kuba@kernel.org, pabeni@redhat.com,
 jasowang@redhat.com, hao.wu@intel.com, axboe@kernel.dk,
 richardcochran@gmail.com, virtualization@lists.linux.dev,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 mdf@kernel.org, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org,
 andy@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 yilun.xu@intel.com, mcoquelin.stm32@gmail.com, linux-fpga@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH 8/9] vdap: solidrun: Replace deprecated
	PCI functions
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

T24gVHVlLCAyMDI0LTA4LTIwIGF0IDEyOjUwICswMjAwLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3Jv
dGU6Cj4gTGUgMjAvMDgvMjAyNCDDoCAxMDowOSwgUGhpbGlwcCBTdGFubmVyIGEgw6ljcml0wqA6
Cj4gPiA+ID4gQEAgLTU1NiwzMyArNTU2LDI0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdmRwYV9j
b25maWdfb3BzCj4gPiA+ID4gc25ldF9jb25maWdfb3BzID0gewo+ID4gPiA+IMKgwqAgc3RhdGlj
IGludCBwc25ldF9vcGVuX3BmX2JhcihzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0Cj4gPiA+
ID4gcHNuZXQKPiA+ID4gPiAqcHNuZXQpCj4gPiA+ID4gwqDCoCB7Cj4gPiA+ID4gwqDCoMKgCWNo
YXIgbmFtZVs1MF07Cj4gPiA+ID4gLQlpbnQgcmV0LCBpLCBtYXNrID0gMDsKPiA+ID4gPiArCWlu
dCBpOwo+ID4gPiA+ICsKPiA+ID4gPiArCXNucHJpbnRmKG5hbWUsIHNpemVvZihuYW1lKSwgInBz
bmV0WyVzXS1iYXJzIiwKPiA+ID4gPiBwY2lfbmFtZShwZGV2KSk7Cj4gPiA+ID4gKwo+ID4gPiA+
IMKgwqDCoAkvKiBXZSBkb24ndCBrbm93IHdoaWNoIEJBUiB3aWxsIGJlIHVzZWQgdG8KPiA+ID4g
PiBjb21tdW5pY2F0ZS4uCj4gPiA+ID4gwqDCoMKgCSAqIFdlIHdpbGwgbWFwIGV2ZXJ5IGJhciB3
aXRoIGxlbiA+IDAuCj4gPiA+ID4gwqDCoMKgCSAqCj4gPiA+ID4gwqDCoMKgCSAqIExhdGVyLCB3
ZSB3aWxsIGRpc2NvdmVyIHRoZSBCQVIgYW5kIHVubWFwIGFsbCBvdGhlcgo+ID4gPiA+IEJBUnMu
Cj4gPiA+ID4gwqDCoMKgCSAqLwo+ID4gPiA+IMKgwqDCoAlmb3IgKGkgPSAwOyBpIDwgUENJX1NU
RF9OVU1fQkFSUzsgaSsrKSB7Cj4gPiA+ID4gLQkJaWYgKHBjaV9yZXNvdXJjZV9sZW4ocGRldiwg
aSkpCj4gPiA+ID4gLQkJCW1hc2sgfD0gKDEgPDwgaSk7Cj4gPiA+ID4gLQl9Cj4gPiA+ID4gLQo+
ID4gPiA+IC0JLyogTm8gQkFSIGNhbiBiZSB1c2VkLi4gKi8KPiA+ID4gPiAtCWlmICghbWFzaykg
ewo+ID4gPiA+IC0JCVNORVRfRVJSKHBkZXYsICJGYWlsZWQgdG8gZmluZCBhIFBDSSBCQVJcbiIp
Owo+ID4gPiA+IC0JCXJldHVybiAtRU5PREVWOwo+ID4gPiA+IC0JfQo+ID4gPiA+IC0KPiA+ID4g
PiAtCXNucHJpbnRmKG5hbWUsIHNpemVvZihuYW1lKSwgInBzbmV0WyVzXS1iYXJzIiwKPiA+ID4g
PiBwY2lfbmFtZShwZGV2KSk7Cj4gPiA+ID4gLQlyZXQgPSBwY2ltX2lvbWFwX3JlZ2lvbnMocGRl
diwgbWFzaywgbmFtZSk7Cj4gPiA+ID4gLQlpZiAocmV0KSB7Cj4gPiA+ID4gLQkJU05FVF9FUlIo
cGRldiwgIkZhaWxlZCB0byByZXF1ZXN0IGFuZCBtYXAgUENJCj4gPiA+ID4gQkFSc1xuIik7Cj4g
PiA+ID4gLQkJcmV0dXJuIHJldDsKPiA+ID4gPiAtCX0KPiA+ID4gPiArCQlpZiAocGNpX3Jlc291
cmNlX2xlbihwZGV2LCBpKSkgewo+ID4gPiA+ICsJCQlwc25ldC0+YmFyc1tpXSA9Cj4gPiA+ID4g
cGNpbV9pb21hcF9yZWdpb24ocGRldiwKPiA+ID4gPiBpLCBuYW1lKTsKPiA+ID4gCj4gPiA+IEhp
LAo+ID4gPiAKPiA+ID4gVW5yZWxhdGVkIHRvIHRoZSBwYXRjaCwgYnV0IGlzIGlzIHNhZmUgdG8g
aGF2ZSAnbmFtZScgYmUgb24gdGhlCj4gPiA+IHN0YWNrPwo+ID4gPiAKPiA+ID4gcGNpbV9pb21h
cF9yZWdpb24oKQo+ID4gPiAtLT4gX19wY2ltX3JlcXVlc3RfcmVnaW9uKCkKPiA+ID4gLS0+IF9f
cGNpbV9yZXF1ZXN0X3JlZ2lvbl9yYW5nZSgpCj4gPiA+IC0tPiByZXF1ZXN0X3JlZ2lvbigpIG9y
IF9fcmVxdWVzdF9tZW1fcmVnaW9uKCkKPiA+ID4gLS0+IF9fcmVxdWVzdF9yZWdpb24oKQo+ID4g
PiAtLT4gX19yZXF1ZXN0X3JlZ2lvbl9sb2NrZWQoKQo+ID4gPiAtLT4gcmVzLT5uYW1lID0gbmFt
ZTsKPiA+ID4gCj4gPiA+IFNvIGFuIGFkZHJlc3Mgb24gdGhlIHN0YWNrIGVuZHMgaW4gdGhlICdu
YW1lJyBmaWVsZCBvZiBhICJzdHJ1Y3QKPiA+ID4gcmVzb3VyY2UiLgo+ID4gCj4gPiBPaCBvaC4u
Lgo+ID4gCj4gPiA+IAo+ID4gPiBBY2NvcmRpbmcgdG8gYSBmZXcgZ3JlcCwgaXQgbG9va3MgcmVh
bGx5IHVudXN1YWwuCj4gPiA+IAo+ID4gPiBJIGRvbid0IGtub3cgaWYgaXQgaXMgdXNlZCwgYnV0
IGl0IGxvb2tzIHN0cmFuZ2UgdG8gbWUuCj4gPiAKPiA+IAo+ID4gSSBoYXZlIHNlZW4gaXQgdXNl
ZCBpbiB0aGUga2VybmVsIHJpbmdidWZmZXIgbG9nIHdoZW4geW91IHRyeSB0bwo+ID4gcmVxdWVz
dCBzb21ldGhpbmcgdGhhdCdzIGFscmVhZHkgb3duZWQuIEkgdGhpbmsgaXQncyBoZXJlLCByaWdo
dCBpbgo+ID4gX19yZXF1ZXN0X3JlZ2lvbl9sb2NrZWQoKToKPiA+IAo+ID4gLyoKPiA+IMKgICog
bW0vaG1tLmMgcmVzZXJ2ZXMgcGh5c2ljYWwgYWRkcmVzc2VzIHdoaWNoIHRoZW4KPiA+IMKgICog
YmVjb21lIHVuYXZhaWxhYmxlIHRvIG90aGVyIHVzZXJzLsKgIENvbmZsaWN0cyBhcmUKPiA+IMKg
ICogbm90IGV4cGVjdGVkLsKgIFdhcm4gdG8gYWlkIGRlYnVnZ2luZyBpZiBlbmNvdW50ZXJlZC4K
PiA+IMKgICovCj4gPiBpZiAoY29uZmxpY3QtPmRlc2MgPT0gSU9SRVNfREVTQ19ERVZJQ0VfUFJJ
VkFURV9NRU1PUlkpIHsKPiA+IAlwcl93YXJuKCJVbmFkZHJlc3NhYmxlIGRldmljZSAlcyAlcFIg
Y29uZmxpY3RzIHdpdGggJXBSIiwKPiA+IAkJY29uZmxpY3QtPm5hbWUsIGNvbmZsaWN0LCByZXMp
Owo+ID4gfQo+ID4gCj4gPiAKPiA+IEFzc3VtaW5nIEkgaW50ZXJwcmV0IHRoZSBjb2RlIGNvcnJl
Y3RseToKPiA+IFRoZSBjb25mbGljdGluZyByZXNvdXJjZSBpcyBmb3VuZCB3aGVuIGEgbmV3IGNh
bGxlciAoZS5nLiBhbm90aGVyCj4gPiBkcml2ZXIpIHRyaWVzIHRvIGdldCB0aGUgc2FtZSByZWdp
b24uIFNvIGNvbmZsaWN0LT5uYW1lIG9uIHRoZQo+ID4gb3JpZ2luYWwKPiA+IHJlcXVlc3Rlcidz
IHN0YWNrIGlzIGJ5IG5vdyBnb25lIGFuZCB5b3UgZG8gZ2V0IFVCLgo+ID4gCj4gPiBWZXJ5IHVu
bGlrZWx5IFVCLCBzaW5jZSBvbmx5IHJhcmVseSBkcml2ZXJzIHJhY2UgZm9yIHRoZSBzYW1lCj4g
PiByZXNvdXJjZSwKPiA+IGJ1dCBzdGlsbCBVQi4KPiA+IAo+ID4gQnV0IHRoZXJlJ3MgYWxzbyBh
IGZldyBvdGhlciBwbGFjZXMuIEdyZXAgZm9yICJjb25mbGljdC0+bmFtZSIuCj4gPiAKPiA+ID4g
Cj4gPiA+IAo+ID4gPiBJZiBpdCBpcyBhbiBpc3N1ZSwgaXQgd2FzIGFwcGFyZW50bHkgYWxyZWFk
eSB0aGVyZSBiZWZvcmUgdGhpcwo+ID4gPiBwYXRjaC4KPiA+IAo+ID4gSSB0aGluayB0aGlzIGhh
cyB0byBiZSBmaXhlZC4KPiA+IAo+ID4gUXVlc3Rpb24gd291bGQganVzdCBiZSB3aGV0aGVyIG9u
ZSB3YW50cyB0byBmaXggaXQgbG9jYWxseSBpbiB0aGlzCj4gPiBkcml2ZXIsIG9yIHByZXZlbnQg
aXQgZnJvbSBoYXBwZW5pbmcgZ2xvYmFsbHkgYnkgbWFraW5nIHRoZSBjb21tb24KPiA+IGluZnJh
c3RydWN0dXJlIGNvcHkgdGhlIHN0cmluZy4KPiA+IAo+ID4gCj4gPiBQLgo+ID4gCj4gCj4gTm90
IGEgcGVyZmVjdCBzY3JpcHQsIGJ1dCB0aGUgYmVsb3cgY29jY2luZWxsZSBzY3JpcHQgb25seSBm
aW5kIHRoaXMgCj4gcGxhY2UsIHNvIEkgd291bGQgKzEgb25seSBmaXhpbmcgdGhpbmdzIGhlcmUg
b25seS4KPiAKPiBBZ3JlZT8KCll1cCwgc291bmRzIGdvb2QuIENvcHlpbmcgdGhlIHN0cmluZyB3
b3VsZCBjYXVzZSB0cm91YmxlIChHRlAgZmxhZ3MpCmFueXdheXMuCgpJJ2xsIHByb3ZpZGUgYSBm
aXggaW4gdjIuCgpUaGFua3MsClAuCgo+IAo+IENKCj4gCj4gCj4gCj4gQEAKPiBpZGVudGlmaWVy
IG5hbWU7Cj4gZXhwcmVzc2lvbiB4Owo+IGNvbnN0YW50IE47Cj4gQEAKPiAJY2hhciBuYW1lW05d
Owo+IAkuLi4KPiAoCj4gKglwY2ltX2lvbWFwX3JlZ2lvbiguLi4sIG5hbWUsIC4uLik7Cj4gPiAK
PiAqCXBjaW1faW9tYXBfcmVnaW9ucyguLi4sIG5hbWUsIC4uLik7Cj4gPiAKPiAqCXJlcXVlc3Rf
cmVnaW9uKC4uLiwgbmFtZSwgLi4uKTsKPiA+IAo+ICoJeCA9IHBjaW1faW9tYXBfcmVnaW9uKC4u
LiwgbmFtZSwgLi4uKTsKPiA+IAo+ICoJeCA9IHBjaW1faW9tYXBfcmVnaW9ucyguLi4sIG5hbWUs
IC4uLik7Cj4gPiAKPiAqCXggPSByZXF1ZXN0X3JlZ2lvbiguLi4sIG5hbWUsIC4uLik7Cj4gKQo+
IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
