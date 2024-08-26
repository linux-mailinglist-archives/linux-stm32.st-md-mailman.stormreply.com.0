Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 078E395E953
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 08:55:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 807CCC6DD72;
	Mon, 26 Aug 2024 06:55:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA959C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 06:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724655329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XIbIq88fuLdpsdaAmmfatKx0XcxitX6MoS0Gk3fKafY=;
 b=fxcLQ6HghEoQh4qg/hYuUJ/9gnnlGZUUisAWN2YEP33sjDcahDN2kot36TtW2azQ4fqxST
 ibQN3iB7m/xN1sbShFGzNce36Lr4ezgR/3Z9xr8T4uQMFwOOPqflXHZm9r3P/AJ8NQ3t6Z
 xKbIl2q/bXyfmEfR+Ljfzo/L9HhFC3U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-i56jiof_O6Oy1_K14Vlnxw-1; Mon, 26 Aug 2024 02:55:27 -0400
X-MC-Unique: i56jiof_O6Oy1_K14Vlnxw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42b929d654bso9742595e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Aug 2024 23:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724655326; x=1725260126;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O2z2TGSU/AHVRPl6zHGllpDM2MIUry+mfdVEnD5XzqM=;
 b=GeY0qKFXUy44a1JoghgY+tKWfo8IqNnVqTBCOeP5Lz4+B6fwp94zNtapOPSVsqCE1r
 oLV2EU2fvgp/7JXC04l9tXhRWajp/WXRClECtThamujVr72FmdTfNU9XWM7d9C0ZFilU
 7ynOi3/v9Gbgs+gqRyjpgA2gDbQ7RTc8+c7kelX7e0M0YrCv5090Y1gGhvztWEpwedkF
 YapCNBtXQVgJnRhf9Gnq+eCDNBhyp8HlYH1rBY7a11NXph/wz8I9tVI7puRu95ZzPUl7
 p9lhsOLduW4f2C8pFopih66joB1qMgeZ0KSqa3wMS7HfbFcOzPYo27sNnD4CUKA99cz7
 bHrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXymH+jy3Bn2vTSc8tD35PwGHulKbLmvue7CyAvURi9vNH2iAOLPXwMgPcmAbvlovNGs2vY7aMHUT0y7w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwvnCgRdgVbSl+m6aWv3hLYqHF6TcqbO8KhI1F4ZRbOUODObyd6
 eJ8m7MzUrZSgCqtD5L3F6X58tT7QnncoZzgaG2ZXhh4WuQzwKM1JGKDbWdrGqOah1qN+9T2s0th
 evaAjVkfnaNHs9kYab+O9hk3TltSCTrFfo1Ugqstai+BGo/VLyx073XSiFPfNJnJFeJuH9sbpWc
 hWYQ==
X-Received: by 2002:a05:600c:3b05:b0:428:1d27:f3db with SMTP id
 5b1f17b1804b1-42b8925903bmr48419315e9.35.1724655326193; 
 Sun, 25 Aug 2024 23:55:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDbFRllMEQMy18KUHdwX+H4HgEvRwxNEXxmAF22JEUYmhjpbjXAt/FXNy3VJHqD5ffhjLW9Q==
X-Received: by 2002:a05:600c:3b05:b0:428:1d27:f3db with SMTP id
 5b1f17b1804b1-42b8925903bmr48419155e9.35.1724655325664; 
 Sun, 25 Aug 2024 23:55:25 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42abef81777sm178404725e9.27.2024.08.25.23.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2024 23:55:25 -0700 (PDT)
Message-ID: <23f1b79be57f1a4d6ce0806fa149d687c2c6d275.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 26 Aug 2024 08:55:22 +0200
In-Reply-To: <81de3898-9af7-4ad1-80ef-68d1f60d4c28@wanadoo.fr>
References: <20240822134744.44919-1-pstanner@redhat.com>
 <20240822134744.44919-8-pstanner@redhat.com>
 <81de3898-9af7-4ad1-80ef-68d1f60d4c28@wanadoo.fr>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-doc@vger.kernel.org, alvaro.karsz@solid-run.com,
 linux-pci@vger.kernel.org, linus.walleij@linaro.org, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, xuanzhuo@linux.alibaba.com,
 corbet@lwn.net, brgl@bgdev.pl, mst@redhat.com, eperezma@redhat.com,
 joabreu@synopsys.com, trix@redhat.com, kuba@kernel.org, dlechner@baylibre.com,
 jasowang@redhat.com, hao.wu@intel.com, axboe@kernel.dk, kch@nvidia.com,
 richardcochran@gmail.com, u.kleine-koenig@pengutronix.de,
 virtualization@lists.linux.dev, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, broonie@kernel.org, mdf@kernel.org, hare@suse.de,
 bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, andy@kernel.org,
 pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, yilun.xu@intel.com, dlemoal@kernel.org,
 mcoquelin.stm32@gmail.com, linux-fpga@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v3 7/9] vdpa: solidrun: Fix UB bug with
	devres
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

T24gVGh1LCAyMDI0LTA4LTIyIGF0IDE2OjM0ICswMjAwLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3Jv
dGU6Cj4gTGUgMjIvMDgvMjAyNCDDoCAxNTo0NywgUGhpbGlwcCBTdGFubmVyIGEgw6ljcml0wqA6
Cj4gPiBJbiBwc25ldF9vcGVuX3BmX2JhcigpIGFuZCBzbmV0X29wZW5fdmZfYmFyKCkgYSBzdHJp
bmcgbGF0ZXIgcGFzc2VkCj4gPiB0bwo+ID4gcGNpbV9pb21hcF9yZWdpb25zKCkgaXMgcGxhY2Vk
IG9uIHRoZSBzdGFjay4gTmVpdGhlcgo+ID4gcGNpbV9pb21hcF9yZWdpb25zKCkgbm9yIHRoZSBm
dW5jdGlvbnMgaXQgY2FsbHMgY29weSB0aGF0IHN0cmluZy4KPiA+IAo+ID4gU2hvdWxkIHRoZSBz
dHJpbmcgbGF0ZXIgZXZlciBiZSB1c2VkLCB0aGlzLCBjb25zZXF1ZW50bHksIGNhdXNlcwo+ID4g
dW5kZWZpbmVkIGJlaGF2aW9yIHNpbmNlIHRoZSBzdGFjayBmcmFtZSB3aWxsIGJ5IHRoZW4gaGF2
ZQo+ID4gZGlzYXBwZWFyZWQuCj4gPiAKPiA+IEZpeCB0aGUgYnVnIGJ5IGFsbG9jYXRpbmcgdGhl
IHN0cmluZ3Mgb24gdGhlIGhlYXAgdGhyb3VnaAo+ID4gZGV2bV9rYXNwcmludGYoKS4KPiA+IAo+
ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcJIyB2Ni4zCj4gPiBGaXhlczogNTFhOGY5ZDdm
NTg3ICgidmlydGlvOiB2ZHBhOiBuZXcgU29saWRORVQgRFBVIGRyaXZlci4iKQo+ID4gUmVwb3J0
ZWQtYnk6IENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+
Cj4gPiBDbG9zZXM6Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNzRlOTEwOWEtYWM1
OS00OWUyLTliMWQtZDgyNWM5YzlmODkxQHdhbmFkb28uZnIvCj4gPiBTdWdnZXN0ZWQtYnk6IEFu
ZHkgU2hldmNoZW5rbyA8YW5keUBrZXJuZWwub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogUGhpbGlw
cCBTdGFubmVyIDxwc3Rhbm5lckByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiDCoCBkcml2ZXJzL3Zk
cGEvc29saWRydW4vc25ldF9tYWluLmMgfCAxMyArKysrKysrKystLS0tCj4gPiDCoCAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92ZHBhL3NvbGlkcnVuL3NuZXRfbWFpbi5jCj4gPiBiL2RyaXZlcnMvdmRw
YS9zb2xpZHJ1bi9zbmV0X21haW4uYwo+ID4gaW5kZXggOTk0MjhhMDQwNjhkLi42NzIzNWY2MTkw
ZWYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3ZkcGEvc29saWRydW4vc25ldF9tYWluLmMKPiA+
ICsrKyBiL2RyaXZlcnMvdmRwYS9zb2xpZHJ1bi9zbmV0X21haW4uYwo+ID4gQEAgLTU1NSw3ICs1
NTUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZkcGFfY29uZmlnX29wcwo+ID4gc25ldF9jb25m
aWdfb3BzID0gewo+ID4gwqAgCj4gPiDCoCBzdGF0aWMgaW50IHBzbmV0X29wZW5fcGZfYmFyKHN0
cnVjdCBwY2lfZGV2ICpwZGV2LCBzdHJ1Y3QgcHNuZXQKPiA+ICpwc25ldCkKPiA+IMKgIHsKPiA+
IC0JY2hhciBuYW1lWzUwXTsKPiA+ICsJY2hhciAqbmFtZTsKPiA+IMKgwqAJaW50IHJldCwgaSwg
bWFzayA9IDA7Cj4gPiDCoMKgCS8qIFdlIGRvbid0IGtub3cgd2hpY2ggQkFSIHdpbGwgYmUgdXNl
ZCB0byBjb21tdW5pY2F0ZS4uCj4gPiDCoMKgCSAqIFdlIHdpbGwgbWFwIGV2ZXJ5IGJhciB3aXRo
IGxlbiA+IDAuCj4gPiBAQCAtNTczLDcgKzU3MywxMCBAQCBzdGF0aWMgaW50IHBzbmV0X29wZW5f
cGZfYmFyKHN0cnVjdCBwY2lfZGV2Cj4gPiAqcGRldiwgc3RydWN0IHBzbmV0ICpwc25ldCkKPiA+
IMKgwqAJCXJldHVybiAtRU5PREVWOwo+ID4gwqDCoAl9Cj4gPiDCoCAKPiA+IC0Jc25wcmludGYo
bmFtZSwgc2l6ZW9mKG5hbWUpLCAicHNuZXRbJXNdLWJhcnMiLAo+ID4gcGNpX25hbWUocGRldikp
Owo+ID4gKwluYW1lID0gZGV2bV9rYXNwcmludGYoJnBkZXYtPmRldiwgR0ZQX0tFUk5FTCwgInBz
bmV0WyVzXS0KPiA+IGJhcnMiLCBwY2lfbmFtZShwZGV2KSk7Cj4gPiArCWlmICghbmFtZSkKPiA+
ICsJCXJldHVybiAtRU5PTUVNOwo+ID4gKwo+ID4gwqDCoAlyZXQgPSBwY2ltX2lvbWFwX3JlZ2lv
bnMocGRldiwgbWFzaywgbmFtZSk7Cj4gPiDCoMKgCWlmIChyZXQpIHsKPiA+IMKgwqAJCVNORVRf
RVJSKHBkZXYsICJGYWlsZWQgdG8gcmVxdWVzdCBhbmQgbWFwIFBDSQo+ID4gQkFSc1xuIik7Cj4g
PiBAQCAtNTkwLDEwICs1OTMsMTIgQEAgc3RhdGljIGludCBwc25ldF9vcGVuX3BmX2JhcihzdHJ1
Y3QgcGNpX2Rldgo+ID4gKnBkZXYsIHN0cnVjdCBwc25ldCAqcHNuZXQpCj4gPiDCoCAKPiA+IMKg
IHN0YXRpYyBpbnQgc25ldF9vcGVuX3ZmX2JhcihzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0
IHNuZXQKPiA+ICpzbmV0KQo+ID4gwqAgewo+ID4gLQljaGFyIG5hbWVbNTBdOwo+ID4gKwljaGFy
ICpuYW1lOwo+ID4gwqDCoAlpbnQgcmV0Owo+ID4gwqAgCj4gPiAtCXNucHJpbnRmKG5hbWUsIHNp
emVvZihuYW1lKSwgInNuZXRbJXNdLWJhciIsCj4gPiBwY2lfbmFtZShwZGV2KSk7Cj4gPiArCW5h
bWUgPSBkZXZtX2thc3ByaW50ZigmcGRldi0+ZGV2LCBHRlBfS0VSTkVMLCAicHNuZXRbJXNdLQo+
ID4gYmFycyIsIHBjaV9uYW1lKHBkZXYpKTsKPiAKPiBzL3BzbmV0L3NuZXQvCgpzaGFycCBleWVz
IDspCgpUaHgsClAuCgo+IAo+ID4gKwlpZiAoIW5hbWUpCj4gPiArCQlyZXR1cm4gLUVOT01FTTsK
PiA+IMKgwqAJLyogUmVxdWVzdCBhbmQgbWFwIEJBUiAqLwo+ID4gwqDCoAlyZXQgPSBwY2ltX2lv
bWFwX3JlZ2lvbnMocGRldiwgQklUKHNuZXQtPnBzbmV0LQo+ID4gPmNmZy52Zl9iYXIpLCBuYW1l
KTsKPiA+IMKgwqAJaWYgKHJldCkgewo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
