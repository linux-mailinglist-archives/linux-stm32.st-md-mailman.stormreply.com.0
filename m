Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE13B0E298
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 19:29:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8564C36B0C;
	Tue, 22 Jul 2025 17:29:32 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BACA6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 17:29:30 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e8986a25cbfso4089351276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 10:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753205369; x=1753810169;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wAsiexFpJG29+h65JJPZFpAJdqh8AwtAuRFszUNX74E=;
 b=RJ4P/abwdpbO3zyE7J9am/FlkEhovSzi1hcU87YEQrRqvcn5KwUCzpnH2NfBYyib3l
 EuXhTbP89pRzkdySgaQxkRH9ACSat3YGRHRZKCy9YJmZvBuV2a+GDY+7VXTfpQkMCfeC
 CqpmH++LuhQO6ZhFnX/YTHrimwaSYxsoz6KSt1yw+cLWy4CyZBp+07hX+o9gMygm8NMq
 u5ejecpnSHD+mQ12N8Lg5OzFM/gR6FpLsWuPSgGbb4j4uoYFnqs4kpFaM2ohgqCe2E7b
 /0nHPalZJi4u6v0es2uxOSw4c9xi2M1KsboLda860dBIaVTffRg4kuT7KG2tbske18wH
 QMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753205369; x=1753810169;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wAsiexFpJG29+h65JJPZFpAJdqh8AwtAuRFszUNX74E=;
 b=j1O7M+rfQegVOUarqQX23W/eorSjA9/geNZbyw6oDAAAD9NeGCqNQvAp/Pz36UuOb2
 PAqiidh/hH4H3nveTQlMPJ7U2vXO4cUh8kCwCjE5zs1ECMAr7t9jtnM2C/P1o+gr7Nws
 QCg0kGZ1kx9r4D92XvpStdipAeU0s1A5RZ4n75/QlOYcVNNbLGIODLeJJUou30xqn5r/
 RcCems6F4B8TGAS4mnUUyhfOVjq0WMI5vkh69pZPdTB7IgDWCcfXkNkhOhS+OiNQKPDf
 DQk/5gFa9GstQZYb5+zB/hwOHn4LTD9XPNMOCuIzbJaixPg3fNnZGYXtPlrIhs5nHXlm
 tdtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGS9bk/LX3ZfBjVZc2xjrHLdP0UPv8567ol5wDi05TDAhY5P9Rrr2r5nFlqOv/s205/6BLLAq7GFeSLw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yybh6mYSKoEclHmLm08QAuEA6tCW0Mp95IueXz5SYpAJDc1zD1b
 cR4Sm+KW8l1MI4yiI4pia7XxGd0tZEZuwkIIbJL3npx+PlKJLbyp6GnO
X-Gm-Gg: ASbGncs4y8521JSIpsWAucCZ/7M3JYbY42M3ib+d/bLrE4oVjqr5mWJzlOtDZp2MrEf
 XyVDiU8MP1D9qxhBE8wptngh7Z40M8LWOKpJjFuCpkGZeMTHPW1YYtHY3XK+Ai1CoohQGgJHTRd
 pz4/k2JqhvsC/1bF6IrxuPt2kycH7eLJIlckSVFXL9qZtUUncDgTFy55czll0TC89WvPdS5SKpE
 viUGqBR9vvtwDDWwcDl+xczpmpEZZFNykEFgbAfsD3iQiATmpoAsfxwPmCiHSd/J8ZYxj/c68Rq
 pgZinXqTCqFDGh7YzpSeEuJkVKGp6vnRAknHqdNh46orXTH8WhX3Pqz8dzeHsS+gKf4DR6TW4Fl
 xEnixnbW+p7AFu29c0LiB8/h+F0Vwv14UrbeI/hDlADJnW/gfE1pAO7SolETvmzE9JWbTbA==
X-Google-Smtp-Source: AGHT+IF7A13lSEqts+dgqsU65x9gG5+n8sudziRUQP5o9tvzg5UXPLY2Xux38fUj0ahxVpgCIrZuJA==
X-Received: by 2002:a05:690c:8c08:b0:719:4bd6:8ba6 with SMTP id
 00721157ae682-7194bd68c99mr168256107b3.20.1753205369278; 
 Tue, 22 Jul 2025 10:29:29 -0700 (PDT)
Received: from localhost (23.67.48.34.bc.googleusercontent.com. [34.48.67.23])
 by smtp.gmail.com with UTF8SMTPSA id
 00721157ae682-719532c7cc0sm26018107b3.70.2025.07.22.10.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 10:29:28 -0700 (PDT)
Date: Tue, 22 Jul 2025 13:29:28 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Message-ID: <687fca7852e84_2cbf622949d@willemb.c.googlers.com.notmuch>
In-Reply-To: <CAL+tcoC5KnTuWKxKcUqFGh-nBSF+X+RWzr=RkkK86+jY1Q20Kw@mail.gmail.com>
References: <20250721083343.16482-1-kerneljasonxing@gmail.com>
 <20250721083343.16482-2-kerneljasonxing@gmail.com>
 <8c9e97e4-3590-49a8-940b-717deac0078d@molgen.mpg.de>
 <CAL+tcoAP7Zk7A4pzK-za+_NMoX11SGR3ubtY6R+aaywoEq_H+g@mail.gmail.com>
 <687f9d4cf0b14_2aa7cc29443@willemb.c.googlers.com.notmuch>
 <CAL+tcoC5KnTuWKxKcUqFGh-nBSF+X+RWzr=RkkK86+jY1Q20Kw@mail.gmail.com>
Mime-Version: 1.0
Cc: edumazet@google.com, anthony.l.nguyen@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 przemyslaw.kitszel@intel.com, john.fastabend@gmail.com, sdf@fomichev.me,
 intel-wired-lan@lists.osuosl.org, kuba@kernel.org, pabeni@redhat.com,
 Jason Xing <kernelxing@tencent.com>, Paul Menzel <pmenzel@molgen.mpg.de>,
 maciej.fijalkowski@intel.com, hawk@kernel.org, ast@kernel.org,
 magnus.karlsson@intel.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 bjorn@kernel.org, mcoquelin.stm32@gmail.com, jonathan.lemon@gmail.com,
 bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [Intel-wired-lan] [PATCH net-next 1/2] stmmac:
 xsk: fix underflow of budget in zerocopy mode
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

SmFzb24gWGluZyB3cm90ZToKPiBPbiBUdWUsIEp1bCAyMiwgMjAyNSBhdCAxMDoxNuKAr1BNIFdp
bGxlbSBkZSBCcnVpam4KPiA8d2lsbGVtZGVicnVpam4ua2VybmVsQGdtYWlsLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gSmFzb24gWGluZyB3cm90ZToKPiA+ID4gSGkgUGF1bCwKPiA+ID4KPiA+ID4gT24g
TW9uLCBKdWwgMjEsIDIwMjUgYXQgNDo1NuKAr1BNIFBhdWwgTWVuemVsIDxwbWVuemVsQG1vbGdl
bi5tcGcuZGU+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gRGVhciBKYXNvbiwKPiA+ID4gPgo+ID4g
PiA+Cj4gPiA+ID4gVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLgo+ID4gPgo+ID4gPiBUaGFua3Mg
Zm9yIHlvdXIgcXVpY2sgcmVzcG9uc2UgYW5kIHJldmlldyA6KQo+ID4gPgo+ID4gPiA+Cj4gPiA+
ID4gQW0gMjEuMDcuMjUgdW0gMTA6MzMgc2NocmllYiBKYXNvbiBYaW5nOgo+ID4gPiA+ID4gRnJv
bTogSmFzb24gWGluZyA8a2VybmVseGluZ0B0ZW5jZW50LmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBUaGUgaXNzdWUgY2FuIGhhcHBlbiB3aGVuIHRoZSBidWRnZXQgbnVtYmVyIG9mIGRlc2NzIGFy
ZSBjb25zdW1lZC4gQXMKPiA+ID4gPgo+ID4gPiA+IEluc3RlYWQgb2Yg4oCcVGhlIGlzc3Vl4oCd
LCBJ4oCZZCB1c2Ug4oCcQW4gdW5kZXJmbG93IOKApuKAnS4KPiA+ID4KPiA+ID4gV2lsbCBjaGFu
Z2UgaXQuCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+IGxvbmcgYXMgdGhlIGJ1ZGdldCBpcyBkZWNy
ZWFzZWQgdG8gemVybywgaXQgd2lsbCBhZ2FpbiBnbyBpbnRvCj4gPiA+ID4gPiB3aGlsZSAoYnVk
Z2V0LS0gPiAwKSBzdGF0ZW1lbnQgYW5kIGdldCBkZWNyZWFzZWQgYnkgb25lLCBzbyB0aGUKPiA+
ID4gPiA+IHVuZGVyZmxvdyBpc3N1ZSBjYW4gaGFwcGVuLiBJdCB3aWxsIGxlYWQgdG8gcmV0dXJu
aW5nIHRydWUgd2hlcmVhcyB0aGUKPiA+ID4gPiA+IGV4cGVjdGVkIHZhbHVlIHNob3VsZCBiZSBm
YWxzZS4KPiA+ID4gPgo+ID4gPiA+IFdoYXQgaXMg4oCcaXTigJ0/Cj4gPiA+Cj4gPiA+IEl0IG1l
YW5zICd1bmRlcmZsb3cgb2YgYnVkZ2V0JyBiZWhhdmlvci4KPiA+Cj4gPiBBIHRlY2huaWNhbGl0
eSwgYnV0IHRoaXMgaXMgKG5lZ2F0aXZlKSBvdmVyZmxvdy4KPiA+Cj4gPiBVbmRlcmZsb3cgaXMg
YSBjb21wdXRhdGlvbiB0aGF0IHJlc3VsdHMgaW4gYSB2YWx1ZSB0aGF0IGlzIHRvbyBzbWFsbAo+
ID4gdG8gYmUgcmVwcmVzZW50ZWQgYnkgdGhlIGdpdmVuIHR5cGUuCj4gCj4gSW50ZXJlc3Rpbmcu
IFRoYW5rcyBmb3Igc2hhcmluZyB0aGlzIHdpdGggbWU6KQo+IAo+IEkganVzdCBjaGVja2VkIHRo
ZSB3aWtpcGVkaWFbMV0gdGhhdCBzYXlzICIgVW5kZXJmbG93IGNhbiBpbiBwYXJ0IGJlCj4gcmVn
YXJkZWQgYXMgbmVnYXRpdmUgb3ZlcmZsb3cgb2YgdGhlIGV4cG9uZW50IG9mIHRoZSBmbG9hdGlu
Zy1wb2ludAo+IHZhbHVlLiIuIEkgYXNzdW1lIHRoaXMgcnVsZSBjYW4gYWxzbyBiZSBhcHBsaWVk
IGluIHRoaXMgY2FzZT8gSSdtCj4gaGVzaXRhbnQgdG8gc2VuZCB0aGUgdjMgcGF0Y2ggdG9tb3Jy
b3cgd2l0aCB0aGlzICduZWdhdGl2ZSBvdmVyZmxvdycKPiB0ZXJtIGluY2x1ZGVkLgoKTXkgcG9p
bnQgaXMgdmVyeSBwZWRhbnRpYy4gSSB0aGluayB0aGVzZSBjYXNlcyBhcmUgbm90IHVuZGVyZmxv
dy4KCkJ1dCBpdCBpcyBvZnRlbiBjYWxsZWQgdGhhdCwgdW5kZXJzdGFuZGFibHkuIFNvIGNob29z
ZSBhcyB5b3Ugc2VlIGZpdC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
