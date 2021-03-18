Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A6C340715
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Mar 2021 14:45:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D089FC58D40;
	Thu, 18 Mar 2021 13:45:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F9DDC57B7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 13:45:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12IDfsx8014144; Thu, 18 Mar 2021 14:45:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=Mh1XkVMq3Xtlf2kfvBLiZv4WU5GJ6+7sEcK44RV22zs=;
 b=QULZ//VBLoES34B/3tASXpKg+U0hiF/0+LB/39QYzzufpbfUch4j0zUfP2bSknHlAIgC
 vQFXWGxXAMn6zVW2xFuxHfr3oTlkuXkEYV5o1xbP8fFWGiAfwaBCu4WOwDAg5VYmGhUL
 G2CKMHZMz78Cjqfa9YAay+6aGO3P3vcwE+q3CVplQWoyVXhtcVNMZ1mvPhCqloARWvo2
 XqQxxlMrDYsCxdDu95ihbbFyHTa2BkJ65QvmwXDSc/AxJfrJ8+jO/rkttIBXwW/K3Qd7
 Ca7vJtEeO1MAKsrJIVVa9Ncqi7zr+pfSPBs1YTNsVPjDpswwnsvLDGyCEx/OzO/bjqRp 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37a8prbn29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 14:45:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DAA0D100038;
 Thu, 18 Mar 2021 14:45:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C67E52272B1;
 Thu, 18 Mar 2021 14:45:02 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 14:45:02
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <robh+dt@kernel.org>
Date: Thu, 18 Mar 2021 14:44:48 +0100
Message-ID: <1616075089-28115-2-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616075089-28115-1-git-send-email-alain.volmat@foss.st.com>
References: <1616075089-28115-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-18_07:2021-03-17,
 2021-03-18 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/2] dt-bindings: i2c: stm32f7: add st,
	smbus-alert binding for SMBus Alert
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Based on the SMBus specification, SMBus Alert active state is low.
As often on SoC, the SMBus Alert pin is not only dedicated to this
feature and can also be used for another purpose (by configuring it
as alternate function for other functions via pinctrl).

"smbus" dt-binding has been introduced recently [1], however it is also
used to indicate usage of host-notify feature.
Relying on 'smbus' binding for SMBus-Alert as well as it was discussed
previously [2] would lead to requiring the SMBALERT# pin to be configured
as alternate function for i2c/smbus controller even if only host-notify is
needed.
Indeed, not doing so would lead to spurious SMBus Alert interrupts since
the i2c/smbus controller would see the (not configured) SMBA pin as low
level.

For that reason, SMBus-Alert needs to have its own binding in order
to only be enabled whenever SMBALERT# pin is configured as alternate
function for i2c/smbus controller.

[1] https://marc.info/?l=linux-i2c&m=159531254413805&w=2
[2] https://marc.info/?l=linux-renesas-soc&m=159361426409817&w=2

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

---
v2: introduce st,smbus-alert property
---
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index d747f4990ad8..0d45ead7d835 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -36,6 +36,11 @@ allOf:
             minItems: 3
             maxItems: 3
 
+        st,smbus-alert:
+          description: Enable the SMBus-Alert via SMBA pin, note SMBA pin
+                       must also be configured via pinctrl.
+          type: boolean
+
   - if:
       properties:
         compatible:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
