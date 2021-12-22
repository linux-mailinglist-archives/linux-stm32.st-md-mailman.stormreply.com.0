Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F77A47D030
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Dec 2021 11:45:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4626C5F1EE;
	Wed, 22 Dec 2021 10:45:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08FBEC5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 09:05:56 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d9so3580191wrb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 01:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yFNkjOhkbVUPCPag3+lAuNDHEf6o3ru8j250NbFjPto=;
 b=PWovdBphqrEK39M+gpDvGqxAdVPJl6QRH08LDrE+POux+PO7tP7Nq3+hmvFGa/a53/
 XL4qcWwkKXpqepZ9OJ6dRIlDgLiBr3KiSIaAltvzLJG+QFcoIeTRF+DE3+Lq8xaCSkcO
 DCmqg/yNfXwUSWbixP4Nz4sPf/o+ES/VSQZ8Jq8iUBnnixA7IEI2eepCOHFPVWsyTEre
 VrauRXaUmPCXzMC+Pnr0GHA4Aj7LOhjmvVG1i0T5IXo8SZiYdj/FkZZ7dJSrSMSN3tbx
 c+6weXHSCO2prqtwazZPDjQ4pA2nwe5rCz5NLTI4oGG5wPHKr2CBamLoX96GgGiPaFHp
 cY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yFNkjOhkbVUPCPag3+lAuNDHEf6o3ru8j250NbFjPto=;
 b=Jkp3ICpNjubujA0/Zobt+zi9/sq2R8J97WG3EPM/y7/1AHbcKxkYc2LEAgd1VezCAM
 GTq/QrkASKScx5wcVWlVBo4E9NVAGvlw6fLLVxoQ8biOBLsjxHh4zRT3XfQ2eEnMPY0K
 MT1LloZU0AZrbuv4MeqNEYuY7/SmU9gxjuYqqLQVrFBOOPgZUK3dHTx3P8gwikhqNN39
 S2bZRRb5MhJ6WVtLrcU6YxvINVh+dQiS+Se2bdCruyo9PmAwN+YaoS/kq5POxR6EPdnI
 pQIJ893S7v2qiUgs/Mr3pMtg7UFEbQssbivfo73two732/fycHCRAfRSTRs7CvD24ATn
 wUmw==
X-Gm-Message-State: AOAM5317tGqglN64Otj+CgElmtMiTI69PgQOtk5TQRfajh+eJPbaERBR
 D+nUSpMnqTmWG4ht4TpCCNU=
X-Google-Smtp-Source: ABdhPJy7flmzMTQMI+3SUiNfM2NPwtetHwfXTX+i112NC6r7WXwuYpXcaDAx0EErcXx/XtP7nmcycA==
X-Received: by 2002:a5d:64ed:: with SMTP id g13mr1384847wri.197.1640163956459; 
 Wed, 22 Dec 2021 01:05:56 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id a22sm1139775wme.19.2021.12.22.01.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:05:56 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Date: Wed, 22 Dec 2021 10:05:46 +0100
Message-Id: <20211222090552.25972-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Dec 2021 10:45:15 +0000
Cc: airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 alexandre.torgue@foss.st.com, stefan@agner.ch, benjamin.gaignard@linaro.org,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, marex@denx.de,
 linux-imx@nxp.com, intel-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, daniel@ffwll.ch,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 jani.nikula@linux.intel.com, yannick.fertre@foss.st.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 dmitry.baryshkov@linaro.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 shawnguo@kernel.org
Subject: [Linux-stm32] [PATCH v2 0/6] Add missing format_mod_supported
	functions
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

SGkgYWxsLAoKVGhpcyBwYXRjaHNldCBzdXBlcnNlZGVzIFsxXS4gTm93IHRoZSB0aXRsZSBpcyBh
IGJpdCBtaXNsZWFkaW5nLCBidXQKSSBsZWZ0IGl0IHRoaXMgd2F5IHRvIChob3BlZnVsbHkpIGZh
Y2lsaXRhdGUgdGhlIG1haW50YWluZXJzJyB3b3JrLgoKQSBsaXR0bGUgY29udGV4dDogT3JpZ2lu
YWxseSwgSSBzZW50IGEgcGF0Y2ggYWRkaW5nIG1vZGlmaWVycyB0byB0aGUKVktNUyBkcml2ZXIg
YW5kIFNpbW9uIFNlciBraW5kbHkgcmV2aWV3ZWQgaXQgYW5kIHBvaW50ZWQgb3V0IHRoYXQKImZv
cm1hdF9tb2Rfc3VwcG9ydGVkIiB3YXMgbWlzc2luZyBbMl0uCkkgYXNrZWQgaWYgdGhlIGRvY3Mg
d2VyZSBpbmNvcnJlY3Qgb3IgaWYgaXQgd2FzIGEgYnVnIGluCiJjcmVhdGVfaW5fZm9ybWF0X2Js
b2IiLgoKSW4gdGhlIGZpcnN0IHZlcnNpb24gb2YgdGhpcyBzZXJpZXMsIFNpbW9uIFNlciBhbmQg
RG1pdHJ5IEJhcnlzaGtvdgphZ3JlZWQgWzFdIHRoYXQgdGhlIGNvZGUgc2hvdWxkIGJlaGF2ZSBh
cyBkb2N1bWVudGVkIGFuZAoiY3JlYXRlX2luX2Zvcm1hdF9ibG9iIiBzaG91bGQgYmUgY2hhbmdl
ZC4KClRoaXMgc2Vjb25kIHZlcnNpb24gaW1wbGVtZW50cyB0aGUgcmVxdWlyZWQgY2hhbmdlcyBh
bmQgZHJvcHMgdGhlCiJmb3JtYXRfbW9kX3N1cHBvcnRlZCIgaW4gdGhlIGRyaXZlcnMgdGhhdCBj
YW4gdXNlIHRoZSBkZWZhdWx0CmltcGxlbWVudGF0aW9uLgoKSm9zZQoKWzFdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2RyaS1kZXZlbC9DQUE4RUpwcUotdFdtYjVCYTZYU0s1OXRvQ3RMYjNuUlJt
Vkg4ZGE0VWRfcnJSWXl0bXdAbWFpbC5nbWFpbC5jb20vVC8KWzJdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2RyaS1kZXZlbC8yMDIxMTIxNjE3MDUzMi5HQTE2MzQ5QGVsZW1lbnRhcnkvVC8KCkpv
c8OpIEV4cMOzc2l0byAoNik6CiAgZHJtL3BsYW5lOiBNYWtlIGZvcm1hdF9tb2Rfc3VwcG9ydGVk
IHRydWx5wqBvcHRpb25hbAogIGRybS9wbGFuZTogRml4IHR5cG8gaW4gZm9ybWF0X21vZF9zdXBw
b3J0ZWQgZG9jdW1lbnRhdGlvbgogIGRybS9zaW1wbGUta21zOiBEcm9wIGZvcm1hdF9tb2Rfc3Vw
cG9ydGVkIGZ1bmN0aW9uCiAgZHJtL2k5MTUvZGlzcGxheTogRHJvcCBmb3JtYXRfbW9kX3N1cHBv
cnRlZCBmdW5jdGlvbgogIGRybTogbXhzZmI6IERyb3AgZm9ybWF0X21vZF9zdXBwb3J0ZWQgZnVu
Y3Rpb24KICBkcm0vc3RtOiBsdGRjOiBEcm9wIGZvcm1hdF9tb2Rfc3VwcG9ydGVkIGZ1bmN0aW9u
CgogZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jICAgICAgICAgICAgICAgICB8ICA4ICsrLS0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmMgICAgIHwgIDggLS0t
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3Vyc29yLmMgfCAgOCAt
LS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2ttcy5jICAgICAgICAgICB8ICA4
IC0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyAgICAgICAgICAgICAgICAgIHwg
MTEgLS0tLS0tLS0tLS0KIGluY2x1ZGUvZHJtL2RybV9wbGFuZS5oICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArLQogNiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQyIGRlbGV0aW9u
cygtKQoKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
