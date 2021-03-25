Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EF93488E8
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 07:20:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E10D3C57B5F;
	Thu, 25 Mar 2021 06:20:02 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98CBFC57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 06:19:59 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id r17so807970pgi.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Mar 2021 23:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y2ugCPlO8XWjx6bQzXAXSnErBAV9ElhMwDzxktw9ft8=;
 b=aGlhyI8r09B7KRQ4e5fGXcjPjRmsW0P/dClqRHyxUxiwyq/CTqr4wpYiXGvdl52Yx7
 VKHB+y+q0ABtZBK4lL8ciaGl1dtIurKvIUeeujK5XKw/Qnr/gy91Q7tA4/fjE/I0q7B7
 4ddfmYpR8bOZuOl6J+eLpaoj916b9AO9wHZkUTaaSX6ONH76RYlWtURTMqZOC6WUY4IJ
 C1IG9qhAL7V/bstfE8fMaNWk3AF6yfuxrHG4c+NJCLMyJbqRcFc9YAQ5mPhmkfugodgN
 B/Jpv6kMw1EeJAZH2n3GE2acGiIw/uyAp3N4+YDBnGOUANnB3C8Jj3kdmawmxjk9LWww
 RKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y2ugCPlO8XWjx6bQzXAXSnErBAV9ElhMwDzxktw9ft8=;
 b=iFsZRr48BjapaK4OPY+8Wgstbgr4Z4WjN9fpSmluC1yy1/+CaEfVtyqnt5FzlLj3ZO
 sukbsGPbfurriioe1F6PuW+CykJPuhJJms/k8LGgM5qYolK3MHNzITVX9t5my3gYDNUD
 sBeJPG+fscNmBH+VSd5MxaUSZK+/uYQdqiE1xjN0pAGoQJkoE/a/iOV0T5dsvOLoVlKn
 SS5syPuqyuU4wdaFm6/ZI/PKvcTpiXIYxpQR7RhGyv35HDBO7HPwxAmwXMQ2uqqB7IKM
 1bpUZGbk1k0GMLRE4dkvg6MZSW6lNZ2JRauV1qzpx3U2urHKL+hvRAFKlkXjwKJ2qfTO
 k2uw==
X-Gm-Message-State: AOAM531hfeGlvVyso3+RfNsSL8jBu3Qy1/csZXq2muy+dsF9n78QHAbg
 d+irn0NU9r0i5ajYimv6VBg=
X-Google-Smtp-Source: ABdhPJyjjw6N0G9zVOkj9wsRmVAMLRCK5yCcScA8pzH+IzNNVlZ4LF7um7yQEOrgUePXzn8yBgyBpg==
X-Received: by 2002:a17:902:b68b:b029:e6:cda9:39d with SMTP id
 c11-20020a170902b68bb02900e6cda9039dmr7838709pls.63.1616653198286; 
 Wed, 24 Mar 2021 23:19:58 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id b19sm4393086pfo.7.2021.03.24.23.19.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Mar 2021 23:19:58 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@foss.st.com, erwan.leray@st.com,
 linux-serial@vger.kernel.org, lkp@intel.com
Date: Thu, 25 Mar 2021 14:19:22 +0800
Message-Id: <1616653162-19954-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616653162-19954-1-git-send-email-dillon.minfei@gmail.com>
References: <1616653162-19954-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v5 9/9] dt-bindings: serial: stm32: Use 'type:
	object' instead of false for 'additionalProperties'
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

To use additional properties 'bluetooth' on serial, need replace false with
'type: object' for 'additionalProperties' to make it as a node, else will
run into dtbs_check warnings.

'arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: serial@40004800:
'bluetooth' does not match any of the regexes: 'pinctrl-[0-9]+'

Fixes: af1c2d81695b ("dt-bindings: serial: Convert STM32 UART to json-schema")
Reported-by: kernel test robot <lkp@intel.com>
Tested-by: Valentin Caron <valentin.caron@foss.st.com>
Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

v5: accroding to rob's suggestion, replace false with 'type: object'
    of 'additionalProperties'.

 Documentation/devicetree/bindings/serial/st,stm32-uart.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 8631678283f9..865be05083c3 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -80,7 +80,8 @@ required:
   - interrupts
   - clocks
 
-additionalProperties: false
+additionalProperties:
+  type: object
 
 examples:
   - |
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
