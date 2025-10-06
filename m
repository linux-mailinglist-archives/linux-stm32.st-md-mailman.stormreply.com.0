Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABF5BBF34E
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Oct 2025 22:35:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A589FC349C0;
	Mon,  6 Oct 2025 20:35:09 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3396C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Oct 2025 20:35:07 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-46e326e4e99so33435875e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Oct 2025 13:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759782907; x=1760387707;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w8A8mrbjHOp4I+EQv9aLZuINyxZFXeZgTqLUL4/gbts=;
 b=VVXy2R0jMaa7QRSHS9HeroSQ9bO43FZslQ1gU7D2muuhQG3eFvDSpNEW/Ev/taTvY5
 vH1JNeePGXl6T4Zsqe5JZb44QvLdQMpO5leWlX6+B8B5z7rb6vRL2AEc7SRHZVmq+ZP6
 W428kca12oYHt9VFIAQTDX3o14/MQ78EbD+bRuEnB8fmEY/iG2nTrW0etxjVdQ4bSnbS
 LSfY2Tho5ua87cT8kKErblPPtvGLU18oDV8glPM4RB9+WeaaKSkVMG9MlkdBMgRRKR7W
 KXtpaDbrTJfuSpAnPk6HMTAcD+9HWNfo6hAwouEGnQh2qEkiuh62+cupdpZziIrf3+Q+
 UGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759782907; x=1760387707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w8A8mrbjHOp4I+EQv9aLZuINyxZFXeZgTqLUL4/gbts=;
 b=oy4U+DxKkKFcmtVlB4yMZ2aNqjjYl24QYGz18Q4DawbRG+m6DoFQ1I0xgfCxYQ2B0u
 HehennN8QsWhrBi/stEFzLYU/CdEenXcA9JXdSJIbQde6uB4av2nMV9NLAH55LQjDfXQ
 fjochaTZIBNzm0sb1i28b06ML/qFZfB6+frJVA8JTGcTa5yvCecgW+fauLAJTYVD9Y6B
 vCI8z3g2BqtxXNGVz5cnqxcFecLVhQeinoHPNT7bLaXc+mMrLVzFQxt3Oyjxi2J1OCnE
 eX2d3IliUDiqcb++jDTwQEgZ2sbfPB/WZOp4Ethk80pPIhd95Z0X8jXbiz+Vuq6VWRJs
 yKIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/CLg60EucepK32EeewDwb7xIlvIELFsVXSOWe6qijn/GBODKn9hbDKhgAaWs+moN+y6Ds2kbf83HN7g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxXNksxhT4eVsX4rDLXZn5QU8q48E342BV1UIP9ZagoF5MLBn2e
 D740DJrZtPoisMDXOjxVHCjwXmHOBX26zq+AlfWvqBYHM0cwq3D0YJUN
X-Gm-Gg: ASbGncuJAaUkh203GMyLXBj/mAQ9Ie/qiMzHRHUA1OPlD2RS7QJ7rbMdR3XS+h6l2Hq
 C8hiVdxg33gqNxDaK2HXrZrniMhurQ/KaxN81si0jRE4obZuA75TTfKZYPn4sK94FzMG3Gsdniu
 0hrOkwRsMJFrDVQEcl2C1Y22FU9qsMmde6aS73RpNMa7mD2SAzU/5GLPdWPn2fNMQZ5cNbu3x93
 ZjnJkomwBb2dl2Ya065KhxE39h00bqcTSq2Sxr3Hs96GFCvfE3Wwu6qQp3qpgXGyeYIQIUxXDgy
 CVIJOy7hLCjDjsQQAT0tZm304yfw1240dBD4HIWVw7sjpCJgf3cfq6W2waGXrqJKtWPrW9ozmrK
 +VwzLW7dVVYZ34F1275ljcqBkk/G4uH72PVDjLJz+lA1JA6hy0AM2PoYzafLKUt8uSP9VRfcawR
 5afj11AHkqUDTx
X-Google-Smtp-Source: AGHT+IEnzSpQE+ROtayFnE2b4dPjTQF2CaZO9TdUfVNFcX6ejR4aNYCswD7XdVH/ajIMwYylIXY+YQ==
X-Received: by 2002:a05:600c:2287:b0:45d:d86b:b386 with SMTP id
 5b1f17b1804b1-46fa29f13dfmr4596085e9.14.1759782906754; 
 Mon, 06 Oct 2025 13:35:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e723591fcsm172334545e9.10.2025.10.06.13.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 13:35:06 -0700 (PDT)
Date: Mon, 6 Oct 2025 21:35:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20251006213242.3462e746@pumpkin>
In-Reply-To: <2025100648-capable-register-101b@gregkh>
References: <20251003130006.41681-1-farbere@amazon.com>
 <20251003130006.41681-8-farbere@amazon.com>
 <2025100648-capable-register-101b@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Cc: snitzer@redhat.com, quic_akhilpo@quicinc.com, linus.walleij@linaro.org,
 dri-devel@lists.freedesktop.org, malattia@linux.it,
 linux-stm32@st-md-mailman.stormreply.com, sashal@kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Eliav Farber <farbere@amazon.com>, kadlec@netfilter.org,
 linux-sparse@vger.kernel.org, linux-sunxi@lists.linux.dev, linux@roeck-us.net,
 pmladek@suse.com, jdelvare@suse.com, linux-um@lists.infradead.org,
 tglx@linutronix.de, sean@poorly.run, linux-kernel@vger.kernel.org,
 senozhatsky@chromium.org, netfilter-devel@vger.kernel.org, jack@suse.com,
 akpm@linux-foundation.org, freedreno@lists.freedesktop.org,
 dave.hansen@linux.intel.com, dm-devel@redhat.com, shuah@kernel.org,
 agk@redhat.com, krzysztof.kozlowski@canonical.com, ruanjinjie@huawei.com,
 coreteam@netfilter.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, tytso@mit.edu,
 Linus Torvalds <torvalds@linux-foundation.org>, fw@strlen.de,
 jmaloy@redhat.com, minchan@kernel.org, james.morse@arm.com,
 mcoquelin.stm32@gmail.com, herve.codina@bootlin.com, linux@rasmusvillemoes.dk,
 platform-driver-x86@vger.kernel.org, clm@fb.com, willy@infradead.org,
 linux-kselftest@vger.kernel.org, mgross@linux.intel.com,
 linux-staging@lists.linux.dev, jernej.skrabec@gmail.com, wens@csie.org,
 linux-input@vger.kernel.org, linux-ext4@vger.kernel.org, pablo@netfilter.org,
 rric@kernel.org, jejb@linux.ibm.com, rostedt@goodmis.org, bp@alien8.de,
 linux-hwmon@vger.kernel.org, martin.petersen@oracle.com,
 dmitry.torokhov@gmail.com, David.Laight@aculab.com, ngupta@vflare.org,
 sakari.ailus@linux.intel.com, ying.xue@windriver.com, davem@davemloft.net,
 peterz@infradead.org, linux-mm@kvack.org, adilger.kernel@dilger.ca,
 hpa@zytor.com, linux-scsi@vger.kernel.org, maz@kernel.org, x86@kernel.org,
 mingo@redhat.com, kuba@kernel.org, dushistov@mail.ru, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, josef@toxicpanda.com, hdegoede@redhat.com,
 dsterba@suse.com, andriy.shevchenko@linux.intel.com,
 linux-edac@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 stable@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 luc.vanoostenryck@gmail.com, daniel@ffwll.ch, linux-btrfs@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 07/19 5.15.y] minmax: simplify and
 clarify min_t()/max_t() implementation
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

T24gTW9uLCA2IE9jdCAyMDI1IDEyOjQ3OjQ1ICswMjAwCkdyZWcgS0ggPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPiB3cm90ZToKCihJJ3ZlIGhhZCB0byB0cmltIHRoZSAnVG8nIGxpc3QgdG8g
c2VuZCB0aGlzLi4uKQoKPiBPbiBGcmksIE9jdCAwMywgMjAyNSBhdCAxMjo1OTo1NFBNICswMDAw
LCBFbGlhdiBGYXJiZXIgd3JvdGU6Cj4gPiBGcm9tOiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNA
bGludXgtZm91bmRhdGlvbi5vcmc+Cj4gPiAKPiA+IFsgVXBzdHJlYW0gY29tbWl0IDAxN2ZhM2U4
OTE4Nzg0OGZkMDU2YWY3NTc3NjljOWU2NmFjM2U5M2QgXQo+ID4gCj4gPiBUaGlzIHNpbXBsaWZp
ZXMgdGhlIG1pbl90KCkgYW5kIG1heF90KCkgbWFjcm9zIGJ5IG5vIGxvbmdlciBtYWtpbmcgdGhl
bQo+ID4gd29yayBpbiB0aGUgY29udGV4dCBvZiBhIEMgY29uc3RhbnQgZXhwcmVzc2lvbi4KPiA+
IAo+ID4gVGhhdCBtZWFucyB0aGF0IHlvdSBjYW4gbm8gbG9uZ2VyIHVzZSB0aGVtIGZvciBzdGF0
aWMgaW5pdGlhbGl6ZXJzIG9yCj4gPiBmb3IgYXJyYXkgc2l6ZXMgaW4gdHlwZSBkZWZpbml0aW9u
cywgYnV0IHRoZXJlIHdlcmUgb25seSBhIGNvdXBsZSBvZgo+ID4gc3VjaCB1c2VzLCBhbmQgYWxs
IG9mIHRoZW0gd2VyZSBjb252ZXJ0ZWQgKGZhbW91cyBsYXN0IHdvcmRzKSB0byB1c2UKPiA+IE1J
Tl9UL01BWF9UIGluc3RlYWQuCj4gPiAKPiA+IENjOiBEYXZpZCBMYWlnaHQgPERhdmlkLkxhaWdo
dEBhY3VsYWIuY29tPgo+ID4gQ2M6IExvcmVuem8gU3RvYWtlcyA8bG9yZW56by5zdG9ha2VzQG9y
YWNsZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGlu
dXgtZm91bmRhdGlvbi5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFbGlhdiBGYXJiZXIgPGZhcmJl
cmVAYW1hem9uLmNvbT4gIAo+IAo+IEVsaWF2LCB5b3VyIHRlc3RpbmcgaW5mcmFzdHJ1Y3R1cmUg
bmVlZHMgc29tZSB3b3JrLCB0aGlzIHBhdGNoIGJyZWFrcwo+IHRoZSBidWlsZCBvbiB0aGlzIGtl
cm5lbCB0cmVlOgo+IAo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2luY2x1ZGUvbGludXgva2Vy
bmVsLmg6MTYsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9saXN0Lmg6
OSwKPiAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L3dhaXQuaDo3LAo+ICAg
ICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvd2FpdF9iaXQuaDo4LAo+ICAgICAg
ICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvZnMuaDo2LAo+ICAgICAgICAgICAgICAg
ICAgZnJvbSBmcy9lcm9mcy9pbnRlcm5hbC5oOjEwLAo+ICAgICAgICAgICAgICAgICAgZnJvbSBm
cy9lcm9mcy96ZGF0YS5oOjksCj4gICAgICAgICAgICAgICAgICBmcm9tIGZzL2Vyb2ZzL3pkYXRh
LmM6NjoKPiBmcy9lcm9mcy96ZGF0YS5jOiBJbiBmdW5jdGlvbiDigJh6X2Vyb2ZzX2RlY29tcHJl
c3NfcGNsdXN0ZXLigJk6Cj4gZnMvZXJvZnMvemRhdGEuaDoxODU6NjE6IGVycm9yOiBJU08gQzkw
IGZvcmJpZHMgdmFyaWFibGUgbGVuZ3RoIGFycmF5IOKAmHBhZ2VzX29uc3RhY2vigJkgWy1XZXJy
b3I9dmxhXQo+ICAgMTg1IHwgICAgICAgICBtaW5fdCh1bnNpZ25lZCBpbnQsIFRIUkVBRF9TSVpF
IC8gOCAvIHNpemVvZihzdHJ1Y3QgcGFnZSAqKSwgOTZVKQo+ICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fgoKVGhh
dCBjb25zdGFudCBzZWVtcyB0byBnZXQgKHJlbmFtZWQgYW5kKSBjaGFuZ2VkIHRvIDMyIGluIGEg
bGF0ZXIgcGF0Y2guCkknbSBub3Qgc3VyZSBvZiB0aGUgcmF0aW9uYWwgZm9yIHRoZSBtaW4oKSBh
dCBhbGwuCkkgdGhpbmsgVEhSRUFEX1NJWkUgaXMgdGhlIHNpemUgb2YgdGhlIGtlcm5lbCBzdGFj
az8gT3IgYXQgbGVhc3QgcmVsYXRlZCB0byBpdC4KVGhlIGRlZmF1bHQgc2VlbXMgdG8gYmUgOGsg
b24geDg2LTY0IGFuZCA0ayBvciA4ayBvbiBpMzg2LgpTbyBpdCBpcyBwcmV0dHkgbXVjaCBhbHdh
eXMgZ29pbmcgdG8gYmUgOTYuCgpMaW51cyBhZGRlZCBNSU4oKSB0aGF0IGNhbiBiZSB1c2VkIGZv
ciBhcnJheSBzaXplcy4KQnV0IEknZCBndWVzcyB0aGlzIGNvdWxkIGp1c3QgYmUgY2hhbmdlZCB0
byAzMiAtIG5lZWQgdG8gYXNrIHRoZSBlcm9mcyBndXlzLgoKCURhdmlkCgoKPiAuL2luY2x1ZGUv
bGludXgvbWlubWF4Lmg6NDk6MjM6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYX19j
bXBfb25jZV91bmlxdWXigJkKPiAgICA0OSB8ICAgICAgICAgKHsgdHlwZSB1eCA9ICh4KTsgdHlw
ZSB1eSA9ICh5KTsgX19jbXAob3AsIHV4LCB1eSk7IH0pCj4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgXgo+IC4vaW5jbHVkZS9saW51eC9taW5tYXguaDoxNjQ6Mjc6IG5vdGU6IGluIGV4
cGFuc2lvbiBvZiBtYWNybyDigJhfX2NtcF9vbmNl4oCZCj4gICAxNjQgfCAjZGVmaW5lIG1pbl90
KHR5cGUsIHgsIHkpIF9fY21wX29uY2UobWluLCB0eXBlLCB4LCB5KQo+ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+Cj4gZnMvZXJvZnMvemRhdGEuaDoxODU6OTog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmG1pbl904oCZCj4gICAxODUgfCAgICAgICAg
IG1pbl90KHVuc2lnbmVkIGludCwgVEhSRUFEX1NJWkUgLyA4IC8gc2l6ZW9mKHN0cnVjdCBwYWdl
ICopLCA5NlUpCj4gICAgICAgfCAgICAgICAgIF5+fn5+Cj4gZnMvZXJvZnMvemRhdGEuYzo4NDc6
MzY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhaX0VST0ZTX1ZNQVBfT05TVEFDS19Q
QUdFU+KAmQo+ICAgODQ3IHwgICAgICAgICBzdHJ1Y3QgcGFnZSAqcGFnZXNfb25zdGFja1taX0VS
T0ZTX1ZNQVBfT05TVEFDS19QQUdFU107Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gY2MxOiBhbGwgd2Fybmlu
Z3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKPiAKPiAKPiBJJ2xsIGRyb3AgdGhpcyB3aG9sZSBz
ZXJpZXMsIHBsZWFzZSBkbyBhIGJpdCBtb3JlIHRlc3RpbmcgYmVmb3JlIHNlbmRpbmcKPiBvdXQg
YSBuZXcgdmVyc2lvbi4KPiAKPiB0aGFua3MsCj4gCj4gZ3JlZyBrLWgKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
