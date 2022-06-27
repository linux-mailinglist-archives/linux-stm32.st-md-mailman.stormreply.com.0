Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5327755BBDB
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jun 2022 21:53:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA93AC04003;
	Mon, 27 Jun 2022 19:53:50 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B200C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 19:53:48 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id e63so10057277pgc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 12:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k/l4LcE4w+6LYrCo6/Ek+44r04gbnpHm9yyPA0qKR6A=;
 b=ryYp2naL1201DMNfPmSbpexCs+zqiLsBQDBXHc9esFHxBJ8Ep2LLrsgHtxJtosu2+J
 1iBYfvQQXv6NYwKQ2qXQCc4mHXYQGPYeeUC3hu2OgPUPjZXH+3Hi6Zqo5SyTeGerBVQA
 p1Bh5daOuP6Q9UMRPxlj6vxZpUjBpxOPEYhjttl3pP6gtksJnO1wA5G3ERXmm3iOhFrs
 MlyYmEaZt8I/cdZ0xlE1RQA9V/oE3k4e+iV7r8nrUlXmSvlRImOQktUmXD254MFh7ceV
 2zbWTxt+/QD0MTYLBrv8xqePAliI2A59OkEqXOPrksIatTeOcW53aiRz+65e7KopsoX+
 3osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k/l4LcE4w+6LYrCo6/Ek+44r04gbnpHm9yyPA0qKR6A=;
 b=qtdoaPrjImLInXSWQDl8jBvzRfhAUAzQEBROp6/JssqcOeO8L+I2/0J3vJhuaiHDF9
 Y2ADx1m627y2AIJ4VbuTlvXg5+aLW2RImrInHPdFgHMBVAcDOgl2Zo187fw5X5uL3FS+
 fV39U94+IwepUUuNp9Zbbq5BhrefMReYux6ycbwNiXEKOj9WY8/aSaFG2+LxlrMgOTH2
 UL+h1jLFugiL24AXa1lI53Dqoz6qCzElg2J/GWFi2ehXQmgnCN0B0WeyEV7e959vLz3I
 AOXR/cALm/0SKzraRBHBTVn5zLU+UfisO/qxkDDX8g0O6tT2Zx1uCs8AVOM5xsSIO36A
 fgWQ==
X-Gm-Message-State: AJIora+6tXNjG8oeh+VjLWAn9f2iMBzYC9jnCxZiIUK59t8k797rG8qX
 l45s6jKBoKIrEutS+aR9RBuYCQ==
X-Google-Smtp-Source: AGRyM1ssDeW6Ux1oaY9ixgaaapzXMFszbxcRVeOWaHAYiiaVMZ4HUYtPzqxXzR6I8+fqeJNf8u9hpg==
X-Received: by 2002:a63:7a5d:0:b0:40c:fcbe:4799 with SMTP id
 j29-20020a637a5d000000b0040cfcbe4799mr14428539pgn.297.1656359626928; 
 Mon, 27 Jun 2022 12:53:46 -0700 (PDT)
Received: from hermes.local (204-195-112-199.wavecable.com. [204.195.112.199])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a056a00009000b0051c1b445094sm7821510pfj.7.2022.06.27.12.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 12:53:46 -0700 (PDT)
Date: Mon, 27 Jun 2022 12:53:43 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <20220627125343.44e24c41@hermes.local>
In-Reply-To: <20220627180432.GA136081@embeddedor>
References: <20220627180432.GA136081@embeddedor>
MIME-Version: 1.0
Cc: nvdimm@lists.linux.dev, alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org, coreteam@netfilter.org,
 v9fs-developer@lists.sourceforge.net, Kees Cook <keescook@chromium.org>,
 intel-gfx@lists.freedesktop.org, linux-can@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 virtualization@lists.linux-foundation.org, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-sctp@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH][next] treewide: uapi: Replace zero-length
 arrays with flexible-array members
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

T24gTW9uLCAyNyBKdW4gMjAyMiAyMDowNDozMiArMDIwMAoiR3VzdGF2byBBLiBSLiBTaWx2YSIg
PGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IFRoZXJlIGlzIGEgcmVndWxhciBuZWVk
IGluIHRoZSBrZXJuZWwgdG8gcHJvdmlkZSBhIHdheSB0byBkZWNsYXJlCj4gaGF2aW5nIGEgZHlu
YW1pY2FsbHkgc2l6ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1lbnRzIGluIGEgc3RydWN0dXJlLgo+
IEtlcm5lbCBjb2RlIHNob3VsZCBhbHdheXMgdXNlIOKAnGZsZXhpYmxlIGFycmF5IG1lbWJlcnPi
gJ1bMV0gZm9yIHRoZXNlCj4gY2FzZXMuIFRoZSBvbGRlciBzdHlsZSBvZiBvbmUtZWxlbWVudCBv
ciB6ZXJvLWxlbmd0aCBhcnJheXMgc2hvdWxkCj4gbm8gbG9uZ2VyIGJlIHVzZWRbMl0uCj4gCj4g
VGhpcyBjb2RlIHdhcyB0cmFuc2Zvcm1lZCB3aXRoIHRoZSBoZWxwIG9mIENvY2NpbmVsbGU6Cj4g
KGxpbnV4LTUuMTktcmMyJCBzcGF0Y2ggLS1qb2JzICQoZ2V0Y29uZiBfTlBST0NFU1NPUlNfT05M
TikgLS1zcC1maWxlIHNjcmlwdC5jb2NjaSAtLWluY2x1ZGUtaGVhZGVycyAtLWRpciAuID4gb3V0
cHV0LnBhdGNoKQo+IAo+IEBACj4gaWRlbnRpZmllciBTLCBtZW1iZXIsIGFycmF5Owo+IHR5cGUg
VDEsIFQyOwo+IEBACj4gCj4gc3RydWN0IFMgewo+ICAgLi4uCj4gICBUMSBtZW1iZXI7Cj4gICBU
MiBhcnJheVsKPiAtIDAKPiAgIF07Cj4gfTsKPiAKPiAtZnN0cmljdC1mbGV4LWFycmF5cz0zIGlz
IGNvbWluZyBhbmQgd2UgbmVlZCB0byBsYW5kIHRoZXNlIGNoYW5nZXMKPiB0byBwcmV2ZW50IGlz
c3VlcyBsaWtlIHRoZXNlIGluIHRoZSBzaG9ydCBmdXR1cmU6Cj4gCj4gLi4vZnMvbWluaXgvZGly
LmM6MzM3OjM6IHdhcm5pbmc6ICdzdHJjcHknIHdpbGwgYWx3YXlzIG92ZXJmbG93OyBkZXN0aW5h
dGlvbiBidWZmZXIgaGFzIHNpemUgMCwKPiBidXQgdGhlIHNvdXJjZSBzdHJpbmcgaGFzIGxlbmd0
aCAyIChpbmNsdWRpbmcgTlVMIGJ5dGUpIFstV2ZvcnRpZnktc291cmNlXQo+IAkJc3RyY3B5KGRl
My0+bmFtZSwgIi4iKTsKPiAJCV4KPiAKPiBTaW5jZSB0aGVzZSBhcmUgYWxsIFswXSB0byBbXSBj
aGFuZ2VzLCB0aGUgcmlzayB0byBVQVBJIGlzIG5lYXJseSB6ZXJvLiBJZgo+IHRoaXMgYnJlYWtz
IGFueXRoaW5nLCB3ZSBjYW4gdXNlIGEgdW5pb24gd2l0aCBhIG5ldyBtZW1iZXIgbmFtZS4KPiAK
PiBbMV0gaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvRmxleGlibGVfYXJyYXlfbWVtYmVy
Cj4gWzJdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjUuMTYvcHJvY2Vzcy9kZXBy
ZWNhdGVkLmh0bWwjemVyby1sZW5ndGgtYW5kLW9uZS1lbGVtZW50LWFycmF5cwo+IAo+IExpbms6
IGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy83OAo+IEJ1aWxkLXRlc3RlZC1i
eTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC82MmI2NzVlYy53S1g2QU9aNmNiRTcxdnRG
JTI1bGtwQGludGVsLmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxn
dXN0YXZvYXJzQGtlcm5lbC5vcmc+CgpUaGFua3MgdGhpcyBmaXhlcyB3YXJuaW5nIHdpdGggZ2Nj
LTEyIGluIGlwcm91dGUyLgpJbiBmdW5jdGlvbiDigJh4ZnJtX2FsZ29fcGFyc2XigJksCiAgICBp
bmxpbmVkIGZyb20g4oCYeGZybV9zdGF0ZV9tb2RpZnkuY29uc3Rwcm9w4oCZIGF0IHhmcm1fc3Rh
dGUuYzo1NzM6NToKeGZybV9zdGF0ZS5jOjE2MjozMjogd2FybmluZzogd3JpdGluZyAxIGJ5dGUg
aW50byBhIHJlZ2lvbiBvZiBzaXplIDAgWy1Xc3RyaW5nb3Atb3ZlcmZsb3c9XQogIDE2MiB8ICAg
ICAgICAgICAgICAgICAgICAgICAgIGJ1ZltqXSA9IHZhbDsKICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICB+fn5+fn5+Xn5+fn4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
