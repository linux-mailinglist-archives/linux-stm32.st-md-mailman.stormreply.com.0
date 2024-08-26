Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 313E695F45F
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 16:51:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3578C7801A;
	Mon, 26 Aug 2024 14:51:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5170AC6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724683872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9UCU/xJxgvWhtzFMTtdnl11yAmjwathNxQSdFSMirY=;
 b=KUtPYJDGFQAqM32HhndtBT+HEWq2f6iP1L3pCY9MySPMk1VXA3aAW8s2FJKxV5AknX4N+e
 pWLkCkW9RQYwECqZnPo20iAPbfOBSMof/TGhlLnLEgCI+Qe/tajUCtxuq4enL/qDVP4r9a
 5uGhGgNsuRijlUaLHvNTNZjHw4a6NPk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-8i9aeU-MPjuOQdw2HsYc3g-1; Mon, 26 Aug 2024 10:51:11 -0400
X-MC-Unique: 8i9aeU-MPjuOQdw2HsYc3g-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-37189fa7ad6so3260551f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 07:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724683870; x=1725288670;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ygoQZIsbD2qBAAmAvknxBdRGvmvE0QFAtlIfXcqGyiA=;
 b=DBtfH2uYXKix8/5EfmT/hML7Z6I76k9RNfluQw5Av7XGC1DVlQvMfVgb5GwZOmuBx7
 7SCkP4APB8IywfpNHQ604HQbinGGsEmG1bcdE6s+71olRYmMExVQJDL3w64W/WHITRRa
 tMCxXmDsOUU6gvvMsqASqUrbo5tz+4nveVkaq0A0mgskGbGmqTVgHrk75ojw8Ln2Bjpv
 G4XT0yBH3ImxpUgs2AlvyaqVKLQ96CHCKgeRL8pU3bNFHuRg8VmeDJmHLT0h5evDXjym
 fn4zua6fF6bMDBW6jsyklnOdQDKRPVIBkPkK4yEwK9CHgr0n8KpcUDZBXSws7gSs3spK
 tTbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgIcFOwdAonAwEs4vo/k9xDuOT5qrjQLSIXovfT08ZhlQwqnxN60L4gcmyUGfzjT8toagox1cEvOkKYw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwiAttqeoXEwnRlWFPryoyZpNqPa5o704weQH+2N2ajd/xk8Kf+
 lfr+r3mD9CSneF7KYHQjG6CpCkcg1XRloD/bL3cudkZ57DP9dOL4FkOCSBUur8EqV05gB1mmr14
 Ahs+Qt0XP9mEzWJKPgEnf5TCVDHbD37gGi4xLIgBD04iESNhJqG/yij5rppI9kRQeoDuDVeX+/G
 +SzA==
X-Received: by 2002:a05:6000:18a4:b0:369:b842:5065 with SMTP id
 ffacd0b85a97d-373118c853bmr9315231f8f.41.1724683869832; 
 Mon, 26 Aug 2024 07:51:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzcbeZGAiG9pR7gwgPFjZ9tQkwyQH6hKqQkC/ZviQjFl3Zuqsn+yKqro2WkBtRVRH4FkIJWQ==
X-Received: by 2002:a05:6000:18a4:b0:369:b842:5065 with SMTP id
 ffacd0b85a97d-373118c853bmr9315196f8f.41.1724683869319; 
 Mon, 26 Aug 2024 07:51:09 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-373082096bbsm10889215f8f.89.2024.08.26.07.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 07:51:08 -0700 (PDT)
Message-ID: <ad6af1c4194873e803df65dc4d595f8e4b26cb33.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andy@kernel.org>
Date: Mon, 26 Aug 2024 16:51:07 +0200
In-Reply-To: <ZsdO2q8uD829hP-X@smile.fi.intel.com>
References: <20240822134744.44919-1-pstanner@redhat.com>
 <20240822134744.44919-6-pstanner@redhat.com>
 <ZsdO2q8uD829hP-X@smile.fi.intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael
 S. Tsirkin" <mst@redhat.com>, Alvaro Karsz <alvaro.karsz@solid-run.com>,
 Tom Rix <trix@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-pci@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org,
 Eugenio =?ISO-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Wu Hao <hao.wu@intel.com>,
 Chaitanya Kulkarni <kch@nvidia.com>,
 Richard Cochran <richardcochran@gmail.com>, virtualization@lists.linux.dev,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 David Lechner <dlechner@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fpga@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 5/9] ethernet: cavium: Replace
 deprecated PCI functions
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

T24gVGh1LCAyMDI0LTA4LTIyIGF0IDE3OjQ0ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gVGh1LCBBdWcgMjIsIDIwMjQgYXQgMDM6NDc6MzdQTSArMDIwMCwgUGhpbGlwcCBTdGFu
bmVyIHdyb3RlOgo+ID4gcGNpbV9pb21hcF9yZWdpb25zKCkgYW5kIHBjaW1faW9tYXBfdGFibGUo
KSBoYXZlIGJlZW4gZGVwcmVjYXRlZCBieQo+ID4gdGhlIFBDSSBzdWJzeXN0ZW0gaW4gY29tbWl0
IGUzNTRiYjg0YTRjMSAoIlBDSTogRGVwcmVjYXRlCj4gPiBwY2ltX2lvbWFwX3RhYmxlKCksIHBj
aW1faW9tYXBfcmVnaW9uc19yZXF1ZXN0X2FsbCgpIikuCj4gPiAKPiA+IFJlcGxhY2UgdGhlc2Ug
ZnVuY3Rpb25zIHdpdGggdGhlIGZ1bmN0aW9uIHBjaW1faW9tYXBfcmVnaW9uKCkuCj4gCj4gLi4u
Cj4gCj4gPiAtCWVyciA9IHBjaW1faW9tYXBfcmVnaW9ucyhwZGV2LCAxIDw8IFBDSV9QVFBfQkFS
X05PLAo+ID4gcGNpX25hbWUocGRldikpOwo+ID4gLQlpZiAoZXJyKQo+ID4gKwljbG9jay0+cmVn
X2Jhc2UgPSBwY2ltX2lvbWFwX3JlZ2lvbihwZGV2LCBQQ0lfUFRQX0JBUl9OTywKPiA+IHBjaV9u
YW1lKHBkZXYpKTsKPiA+ICsJaWYgKElTX0VSUihjbG9jay0+cmVnX2Jhc2UpKSB7Cj4gPiArCQll
cnIgPSBQVFJfRVJSKGNsb2NrLT5yZWdfYmFzZSk7Cj4gPiDCoAkJZ290byBlcnJvcl9mcmVlOwo+
ID4gLQo+ID4gLQljbG9jay0+cmVnX2Jhc2UgPSBwY2ltX2lvbWFwX3RhYmxlKHBkZXYpW1BDSV9Q
VFBfQkFSX05PXTsKPiA+ICsJfQo+IAo+IFBlcmhhcHMKPiAKPiAJY2xvY2stPnJlZ19iYXNlID0g
cGNpbV9pb21hcF9yZWdpb24ocGRldiwgUENJX1BUUF9CQVJfTk8sCj4gcGNpX25hbWUocGRldikp
Owo+IAllcnIgPSBQVFJfRVJSX09SX1pFUk8oY2xvY2stPnJlZ19iYXNlKTsKPiAJaWYgKGVycikK
PiAJCWdvdG8gZXJyb3JfZnJlZTsKPiAKPiBUaGlzIHdpbGwgbWFrZSB5b3VyIHBhdGNoIHNtYWxs
ZXIgYW5kIG5lYXRlci4KPiAKPiBQLlMuIERvIHlvdSB1c2UgLS1oaXN0b2dyYW0gZGlmZiBhbGdv
IHdoZW4gcHJlcGFyaW5nIHBhdGNoZXM/CgpTbyBmYXIgbm90LgpTaG91bGQgb25lIGRvIHRoYXQ/
CgpQLgoKCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
