Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0823CA36
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2019 13:42:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EB50D26B4B
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2019 11:42:48 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F8B3D26B4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 11:42:47 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id a15so14044311qtn.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 04:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vjOFdAaYDNmN3A5HT5pM3yHGhYnwl0N9Oc3jefh1rW8=;
 b=j0RVeHL8Khr0VlnuhcwdE+nOiCX1mQmd+StNdZEDBY8zoM8siTM15NLmIqnGoq0BS9
 o57ljDhdsozst5Nsd2nvSvCCF+Lrmqe2Ma7mb7oFFjhr3YR/IVqIHkk19zhD8iFSXM5U
 D1U4gng45f/WObLDk3TqJWH0lh77UMzGs0GRkDHNoJoYYONO8a726f/X8xB8tatszpu8
 O7Q0FPE1uMJl39ybF22UNV1YvvuXKBXYXjSwdCk2Z6jqqy3McW1C8pcXi0KGWJ9Jo2HR
 kBVIesagSyMrHP8WEO/Zn9/YlrGVbK3NlZGaWjnPwvnIw1MnVOpUDhx4G6gvNCk7gvQ3
 qq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vjOFdAaYDNmN3A5HT5pM3yHGhYnwl0N9Oc3jefh1rW8=;
 b=c7OnoUI5QcnfGhAkNQ8o58TEauQWHSSXSKSusma9ottZIW/tqql9HL8kLj19vOIGJ2
 V4goNeCwBEzDfxsykvDXqoA4tNh6Bfk9Zlpf075sSa1MdSqJ7Rp5yOQ8nG+/SLLAlzYf
 gwHS6By7eNxPv0qS+YO+XgPwedUjj87Abg188sr01oqHynYMcRstxyb2JpTY87Pp5bMG
 eIVAoNOHbjuYBtkClt45ZfzwFHsea+7/V4bcnQS/mvi6N/PM4SaTTeJTSo4E7MdXLOL0
 G3pVIliUSSKJ5zMzmQp8DcbxxfhNZW6gWEFj0OorXXkkuRzwFVk3o6pTlHcRPN9HlGnJ
 y1Dw==
X-Gm-Message-State: APjAAAWM5/KURm9MSTzgLGwOik/W1lLE3EutYt350RvXYR0mzPySiF1P
 qlrnBR1B6xaES7R943eD6KQtrkGP6sVKkEyIHZLlEg==
X-Google-Smtp-Source: APXvYqyePZUiQGFy/pxLEHepqbJXYI67xMab3BFWslPBOL+viW6ZLRa45QU0Y62Q1TG83XbVR5WcaY3e7jRmywXQYW4=
X-Received: by 2002:ac8:395b:: with SMTP id t27mr65198889qtb.115.1560253366125; 
 Tue, 11 Jun 2019 04:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190214083145.15148-1-benjamin.gaignard@linaro.org>
 <e25b2626-231b-28d7-93b0-004a21a3685e@st.com>
 <CAOMZO5A6A2sYzfPgjsqQxWcc4Z0YW9-sENW21KumO_XkN3WBYQ@mail.gmail.com>
 <CA+M3ks7LPEpEfOEqiOZ4q2-We-8BjK0FZfeKts4hBzL7GRRHSw@mail.gmail.com>
In-Reply-To: <CA+M3ks7LPEpEfOEqiOZ4q2-We-8BjK0FZfeKts4hBzL7GRRHSw@mail.gmail.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 11 Jun 2019 13:42:34 +0200
Message-ID: <CA+M3ks5UE8VSa1iHVHWw8NfQWU-v_MRYffVPBMLhy53PD9SJxA@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 linux-kernel <linux-kernel@vger.kernel.org>, Hui Liu <jason.hui.liu@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/2] ARM errata 814220
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

TGUgbWVyLiAyNCBhdnIuIDIwMTkgw6AgMDk6MjUsIEJlbmphbWluIEdhaWduYXJkCjxiZW5qYW1p
bi5nYWlnbmFyZEBsaW5hcm8ub3JnPiBhIMOpY3JpdCA6Cj4KPiBMZSBtYXIuIDIzIGF2ci4gMjAx
OSDDoCAxOTo0NiwgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPiBhIMOpY3JpdCA6
Cj4gPgo+ID4gT24gV2VkLCBGZWIgMjcsIDIwMTkgYXQgMToyMSBQTSBBbGV4YW5kcmUgVG9yZ3Vl
Cj4gPiA8YWxleGFuZHJlLnRvcmd1ZUBzdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPgo+ID4gPiBP
biAyLzE0LzE5IDk6MzEgQU0sIEJlbmphbWluIEdhaWduYXJkIHdyb3RlOgo+ID4gPiA+IEltcGxl
bWVudCBBUk0gZXJyYXRhIDgxNDIyMCBmb3IgQ29ydGV4IEE3Lgo+ID4gPiA+Cj4gPiA+ID4gVGhp
cyBwYXRjaCBoYXMgYmVlbiB3cm90ZW4gYnkgSmFzb24gTGl1IHllYXJzIGFnbyBidXQgbmV2ZXIg
c2VuZCB1cHN0cmVhbS4KPiA+ID4gPiBJIGhhdmUgdHJpZWQgdG8gY29udGFjdCB0aGUgYXV0aG9y
IG9uIG11bHRpcGxlIGVtYWlsIGFkZHJlc3NlcyBidXQgSSBoYXZlbid0Cj4gPiA+ID4gZm91bmQg
YW55IHZhbGlkIG9uZS4uLgo+ID4gPiA+IEkgaGF2ZSBrZWVwIEphc29uJ3Mgc2lnbi1vZmYgYW5k
IGp1c3QgcmViYXNlIHRoZSBwYXRjaCBvbiB0byB2NS1yYzYuCj4gPgo+ID4gQWRkaW5nIEphc29u
J3MgTlhQIGUtbWFpbCBhZGRyZXNzLgo+IFRoYW5rcyAhCj4KPiBSdXNzZWxsLCBjYW4gQWxleGFu
ZHJlIHB1c2ggdGhpcyBzZXJpZXMgaW4gc3RtMzIgdHJlZSBvciB5b3UgcHJlZmVyIHRvCj4gbWVy
Z2UgaXQgeW91cnNlbGYgPwo+CgpIZWxsbyBSdXNzZWxsLAoKSSBoYXZlIHB1c2ggdGhpcyBzZXJp
ZXMgaW4geW91ciBwYXRjaCBzeXN0ZW0gd2Vla3MgYWdvLCBidXQgbm90aGluZyBoYXBwZW5zLgpE
byBJIG1pc3Mgc29tZXRoaW5nIGluIHlvdXIgcHJvY2VzcyA/CgpSZWdhcmRzLApCZW5qYW1pbgoK
PiBSZWdhcmRzLAo+IEJlbmphbWluCj4gPgo+ID4gVGhhbmtzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
