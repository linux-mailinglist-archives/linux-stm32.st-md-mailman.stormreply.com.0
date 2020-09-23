Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2C727547E
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Sep 2020 11:26:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A40DC3FAD5;
	Wed, 23 Sep 2020 09:26:15 +0000 (UTC)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40B8CC32EB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Sep 2020 09:08:42 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id e2so12010606vsr.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Sep 2020 02:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oIgYpLtXjizNAj00W4NnTag42BkGA1KmTe8MsxRr30M=;
 b=JqFe8ZKlxQLmOTS0+S2NOyUOXTu2R+cqTgSfpcbAN5dhCl7xKxMkHZz+n4Qrub3UyH
 YODXdn7/2HI+9rbSJjJo2Q/okxyP4Uf94hjlSR2vycbS0YR0p1g7io2RTBsMug9OK5wr
 BEVjNRS2AKFbtmcJQQ9yiDC4nrHcUR/3T0a9N3+vuacIEEZYALaEd+eXkj3RHQIYO6Qm
 JqdH5RTCu66J3FmpV/uruhihD8RqtXEouevITFix3ONHX9MaXKGTVYil46xQAaq4Vp07
 D3/oj3RN+lmn8ytb4ix91C1rpkU2k1dGdwG5fq/3q3FjJdzwRQWmBHGNQE5QSRZBFToN
 GSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oIgYpLtXjizNAj00W4NnTag42BkGA1KmTe8MsxRr30M=;
 b=tKjQtbh/U8K1g2cj5np8M3BtnTtp7ZucMGLpnmPweqN0BHNxEaJhV/UY3syQCQi9pu
 PdkRRxanag/WjFFE/OgtSBGYmC0uWZekyL18Q+MFEXU5tTVfcRw0gGPeOXfaHHKrl8Hc
 0zXPdw63JBqRGH7waDSw6rpqvFnPBbnMMwDv+PPsY7EeL3UYXrLSTtQEUi2V16lI5kJP
 pffCO8DzV9s5eOOKMmq81zP1EfUWDru1QEGT8000MuZu/hl4ys4rtAgCWbiEJmT08cjo
 nO+UzNS+3MnuNZubZwmWfZg/ysKweCdWlz5OnDKQ0tScF+SjDkiMUfm3Ssuf3QACU4uu
 MqLw==
X-Gm-Message-State: AOAM531cbygyBsY+GthVKkdkRGKGfbWIDUMMAi6XO6CPxkm5/qmrGMXL
 ZgWSKTNVph1uQqKl5k60O0mRu9dHsN7r7hINfB0=
X-Google-Smtp-Source: ABdhPJzdWKR6MZFwBb8dNIhCZhmrSt4ZxbwxAarG9bN4zsxoqrFZNT+Sb0sCYRIr4k19Dq1V0I6Fk6nqS5h8y+dtk/o=
X-Received: by 2002:a67:7dcb:: with SMTP id y194mr6368815vsc.26.1600852121235; 
 Wed, 23 Sep 2020 02:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200902075707.9052-1-amelie.delaunay@st.com>
 <20200902075707.9052-2-amelie.delaunay@st.com>
In-Reply-To: <20200902075707.9052-2-amelie.delaunay@st.com>
From: Jun Li <lijun.kernel@gmail.com>
Date: Wed, 23 Sep 2020 17:08:30 +0800
Message-ID: <CAKgpwJWPWFF_yWC0N_7qPONpWCN8U8tKVJ5Ctr1DGqXd_FyWkA@mail.gmail.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
X-Mailman-Approved-At: Wed, 23 Sep 2020 09:26:14 +0000
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v2 1/6] dt-bindings: connector: add
 power-opmode optional property to usb-connector
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

QW1lbGllIERlbGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlAc3QuY29tPiDkuo4yMDIw5bm0OeaciDLm
l6XlkajkuIkg5LiL5Y2INDowMeWGmemBk++8mgo+Cj4gUG93ZXIgb3BlcmF0aW9uIG1vZGUgbWF5
IGRlcGVuZHMgb24gaGFyZHdhcmUgZGVzaWduLCBzbywgYWRkIHRoZSBvcHRpb25hbAo+IHByb3Bl
cnR5IHBvd2VyLW9wbW9kZSBmb3IgdXNiLWMgY29ubmVjdG9yIHRvIHNlbGVjdCB0aGUgcG93ZXIg
b3BlcmF0aW9uCj4gbW9kZSBjYXBhYmlsaXR5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW1lbGllIERl
bGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlAc3QuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4g
LSBBZGQgZGVzY3JpcHRpb24gZm9yIHBvc3NpYmxlIG9wZXJhdGlvbiBjdXJyZW50IHZhbHVlcwo+
IC0tLQo+ICAuLi4vYmluZGluZ3MvY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbCAgICAgfCAy
MCArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nvbm5l
Y3Rvci91c2ItY29ubmVjdG9yLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbAo+IGluZGV4IDliZDUyZTYzYzkzNS4uMmZk
ODViOWE3ZTFhIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Nvbm5lY3Rvci91c2ItY29ubmVjdG9yLnlhbWwKPiBAQCAtODgsNiAr
ODgsMjYgQEAgcHJvcGVydGllczoKPiAgICAgICAgLSBkZXZpY2UKPiAgICAgICAgLSBkdWFsCj4K
PiArICBwb3dlci1vcG1vZGU6Cj4gKyAgICBkZXNjcmlwdGlvbjogRGV0ZXJtaW5lcyB0aGUgcG93
ZXIgb3BlcmF0aW9uIG1vZGUgdGhhdCB0aGUgVHlwZSBDIGNvbm5lY3Rvcgo+ICsgICAgICB3aWxs
IHN1cHBvcnQgYW5kIHdpbGwgYWR2ZXJ0aXNlIHRocm91Z2ggQ0MgcGlucy4KPiArICAgICAgLSAi
ZGVmYXVsdCIgY29ycmVzcG9uZHMgdG8gZGVmYXVsdCBVU0Igdm9sdGFnZSBhbmQgY3VycmVudCBk
ZWZpbmVkIGJ5IHRoZQo+ICsgICAgICAgIFVTQiAyLjAgYW5kIFVTQiAzLjIgc3BlY2lmaWNhdGlv
bnMsIDVWIDUwMG1BIGZvciBVU0IgMi4wIHBvcnRzIGFuZAo+ICsgICAgICAgIDVWIDkwMG1BIG9y
IDE1MDBtQSBmb3IgVVNCIDMuMiBwb3J0cyBpbiBzaW5nbGUtbGFuZSBvciBkdWFsLWxhbmUKPiAr
ICAgICAgICBvcGVyYXRpb24gcmVzcGVjdGl2ZWx5Lgo+ICsgICAgICAtICIxLjVBIiBhbmQgIjMu
MEEiLCA1ViAxLjVBIGFuZCA1ViAzLjBBIHJlc3BlY3RpdmVseSwgYXMgZGVmaW5lZCBpbiBVU0IK
PiArICAgICAgICBUeXBlLUMgQ2FibGUgYW5kIENvbm5lY3RvciBzcGVjaWZpY2F0aW9uLCB3aGVu
IFBvd2VyIERlbGl2ZXJ5IGlzIG5vdAo+ICsgICAgICAgIHN1cHBvcnRlZC4KPiArICAgICAgLSAi
dXNiX3Bvd2VyX2RlbGl2ZXJ5IiB3aGVuIFBvd2VyIERlbGl2ZXJ5IGlzIHN1cHBvcnRlZCwgYXMg
ZGVmaW5lZCBpbgo+ICsgICAgICAgIFVTQiBQb3dlciBEZWxpdmVyeSBzcGVjaWZpY2F0aW9uLgoK
V2h5IG5lZWQgInVzYl9wb3dlcl9kZWxpdmVyeSI/IGlzbid0IHRoaXMgaW5mb3JtYXRpb24gY2Fu
IGJlIGltcGxpZWQgYnkKZXhpc3RpbmcgcHJvcGVydGllcyBsaWtlIGlmICJzb3VyY2UtcGRvcyIg
aXMgcHJlc2VudD8KCkxpIEp1bgo+ICsgICAgYWxsT2Y6Cj4gKyAgICAgIC0gJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCNkZWZpbml0aW9ucy9zdHJpbmcKPiArICAgIGVudW06Cj4gKyAgICAgIC0g
ZGVmYXVsdAo+ICsgICAgICAtIDEuNUEKPiArICAgICAgLSAzLjBBCj4gKyAgICAgIC0gdXNiX3Bv
d2VyX2RlbGl2ZXJ5Cj4gKwo+ICAgICMgVGhlIGZvbGxvd2luZyBhcmUgb3B0aW9uYWwgcHJvcGVy
dGllcyBmb3IgInVzYi1jLWNvbm5lY3RvciIgd2l0aCBwb3dlcgo+ICAgICMgZGVsaXZlcnkgc3Vw
cG9ydC4KPiAgICBzb3VyY2UtcGRvczoKPiAtLQo+IDIuMTcuMQo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
