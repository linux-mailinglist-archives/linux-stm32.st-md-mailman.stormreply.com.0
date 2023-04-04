Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BDD6D6EC8
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 23:18:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35196C6A603;
	Tue,  4 Apr 2023 21:18:33 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7A62C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 21:18:31 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id eg48so135959965edb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 14:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112; t=1680643111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N5EuWHbwdKEeX6a2AZ9C4RTkT1vujytrUzBt+0O0v3M=;
 b=BSXijNbZJBXiMzykKh9QRkhLXFK6izNgWu+k0ocaV1CceHyXMI0uOy5rdcziqYvFbF
 OYcGiiIVlIsZVibw9dKrakGQcKvTmg3aFIdX5pwLXe/wNBO1qAyoY38icHP8bA4QA2Ok
 eAV0nm+Q+R0Cj897TespCICHugQbjPBztEWmFc80+KrrIaLrvphirsz2Hqrwvm2hw8k3
 sKvYwITZz8mQfX4dmjry87ipHywHWXsonh3vXKZJW+yfg2dRIVbhuLKtGyLn2ZkJvFcy
 qCqWIw2TVkaXxK89SwPji2nm4YVXePUFJi5W5noK+GlgvlSB+9tf+f02+OgczQzRwwZB
 JJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680643111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N5EuWHbwdKEeX6a2AZ9C4RTkT1vujytrUzBt+0O0v3M=;
 b=NbYmhlKsSv+rblG9A7/4wymxEOhYVLhbVuMAA+rYCjU+HrRepaO+Ko2td38J5lIvtp
 cyb8/9uOVcTwpIClFLgABYLayxk9BhRJrJ9JCxFjryXnbRWwV1Sv3zWyu9yOVAsNSpDr
 OSb7ge8OvCXir4WOMItmRICk+J32L6dfgpYPwMXFh88nkCDjonONxClO26O91vZC/mW4
 aXqvMrxRjpdyiwCNX16K16Vjvu4rDRCkuFEHTaE3nFLLGlRtodUIRqqyM7UqUGFgJHoE
 uN2gVVqX8Y64aBPLLXMgNg3j/vV7lvzbbxAzO4dwFE/yvv9VFrLR4i5rAFnqfoY2teyr
 pmCA==
X-Gm-Message-State: AAQBX9f7VW3N/z9he/kD7fK6MkbxTKn2vqTCPDQ5vH40T8zP4kLS23Sm
 xztvDNGJt/E6W8FjN2xmi8mfZWQGMI5gZGZ0GAA=
X-Google-Smtp-Source: AKy350bHAXCKtxXDYnrXHt+8nlQqZKE9To9ryn9MAf9sz41QNTGUz5+aTiDSXZhU533fiWr5/jy5JXzsVw31iqiq4Gg=
X-Received: by 2002:a17:906:b6cd:b0:8b1:cd2e:177a with SMTP id
 ec13-20020a170906b6cd00b008b1cd2e177amr485125ejb.6.1680643110980; Tue, 04 Apr
 2023 14:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230404091442.3540092-1-michael.wei.hong.sit@intel.com>
In-Reply-To: <20230404091442.3540092-1-michael.wei.hong.sit@intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 4 Apr 2023 23:18:20 +0200
Message-ID: <CAFBinCBqsrRZbjFOe8p3e2AzgV9jqL4Qo5db6vBBmak2jqk0_A@mail.gmail.com>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Cc: andrew@lunn.ch, Voon Weifeng <weifeng.voon@intel.com>,
 Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Eric Dumazet <edumazet@google.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, hock.leong.kweh@intel.com,
 linux@armlinux.org.uk, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Tan Tee Min <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Zulkifli Muhammad Husaini <muhammad.husaini.zulkifli@intel.com>,
 "David S . Miller" <davem@davemloft.net>, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [RFC net 1/1] net: stmmac: skip PHY scanning when
 PHY already attached in DT mode
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

T24gVHVlLCBBcHIgNCwgMjAyMyBhdCAxMToxNeKAr0FNIE1pY2hhZWwgU2l0IFdlaSBIb25nCjxt
aWNoYWVsLndlaS5ob25nLnNpdEBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gSWYgUEhZIGlzIHN1Y2Nl
c3NmdWxseSBhdHRhY2hlZCBkdXJpbmcgcGh5bGlua19md25vZGVfcGh5X2Nvbm5lY3QoKQo+IGlu
IERUIG1vZGUuIE1BQyBzaG91bGQgbm90IG5lZWQgdG8gc2NhbiBmb3IgUEhZIGFnYWluLgo+Cj4g
QWRkaW5nIGEgbG9naWMgdG8gY2hlY2sgaWYgb3ZyX2FuX2luYmFuZCBpcyBzZXQgYmVmb3JlIHNj
YW5uaW5nIGZvcgo+IGEgUEhZLCBzaW5jZSBwaHlsaW5rX2Z3bm9kZV9waHlfY29ubmVjdCgpIHJl
dHVybnMgMCB3aGVuCj4KPiAgICAgICAgIHBoeV9md25vZGUgPSBmd25vZGVfZ2V0X3BoeV9ub2Rl
KGZ3bm9kZSk7Cj4gICAgICAgICBpZiAoSVNfRVJSKHBoeV9md25vZGUpKSB7Cj4gICAgICAgICAg
ICAgICAgIGlmIChwbC0+Y2ZnX2xpbmtfYW5fbW9kZSA9PSBNTE9fQU5fUEhZKQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ICAgICAgICAgICAgICAgICByZXR1cm4g
MDsKPiAgICAgICAgIH0KPgo+IEZpeGVzOiBmZTJjZmJjOTY4MDMgKCJuZXQ6IHN0bW1hYzogY2hl
Y2sgaWYgTUFDIG5lZWRzIHRvIGF0dGFjaCB0byBhIFBIWSIpCj4gU2lnbmVkLW9mZi1ieTogTWlj
aGFlbCBTaXQgV2VpIEhvbmcgPG1pY2hhZWwud2VpLmhvbmcuc2l0QGludGVsLmNvbT4KVGhhbmsg
eW91IGZvciB3b3JraW5nIG9uIHRoaXMhIFlvdXIgcGF0Y2ggZml4ZXMgdGhlIGlzc3VlIEkgcmVw
b3J0ZWQsCkV0aGVybmV0IGlzIGJhY2sgb24gbXkgWDk2IEFpciBzbyB0aGlzIHBhdGNoIGlzOgpU
ZXN0ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xl
bWFpbC5jb20+CgpNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgUnVzc2VsbCBLaW5nIGlzIGFza2lu
ZyBmb3IgYSBzZWNvbmQgaXRlcmF0aW9uCm9mIHRoaXMgcGF0Y2ggd2l0aCBoaXMgZmVlZGJhY2sg
aW5jb3Jwb3JhdGVkLiBJJ20gaGFwcHkgdG8gdGVzdCB0aGlzCnNlY29uZCB2ZXJzaW9uIGFzIHdl
bGwgaWYgeW91IGtlZXAgbWUgQ2MnZWQuCkZvciB0aGlzIHNlY29uZCB2ZXJzaW9uIHlvdSBjYW4g
YWxzbyAodW5jb25kaXRpb25hbGx5KSBhZGQ6ClJlcG9ydGVkLWJ5OiBNYXJ0aW4gQmx1bWVuc3Rp
bmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKCkJlc3QgcmVnYXJkcywK
TWFydGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
